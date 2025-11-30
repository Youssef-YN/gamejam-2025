extends Node2D
class_name CoffinMovementComponent

var speed = 30.0
var vertical: bool = true

var knockback_velocity: Vector2 = Vector2.ZERO
const KB_DECAY := 600.
const KB_MAX := 150.

var coffin: EnemyCoffin

func _ready() -> void:
	await owner.ready
	coffin = owner


func _physics_process(delta: float) -> void:
	if coffin.is_dying:
		return
	## While knockback is active, apply it, make it slowly move towards zero then skip the normal animation
	if knockback_velocity.length() > 0.:
		coffin.velocity = knockback_velocity
		knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, KB_DECAY * delta)
		coffin.move_and_slide()
		return
	
	## Get the position of player TODO: Replace with agent
	var direction := (Context.player.global_position - global_position).normalized()
	
	## If horizontal direction is way stronger (x1.2) than vertical, apply it as the direction, otherwise apply vertical as direction
	if abs(direction.x) > abs(direction.y) * 1.2:
		direction = Vector2(sign(direction.x), 0)
		vertical = false
	elif abs(direction.y) > abs(direction.x) * 1.2:
		direction = Vector2(0, sign(direction.y))
		vertical = true
	
	## If the difference between the two direction is too small aka less than x1.2 then don't change direction
	else:
		direction = Vector2(sign(direction.x), 0) if not vertical else Vector2(0, sign(direction.y))
	
	## Stop the enemy from moving while attacking
	if coffin.sprite.is_attacking:
		direction = Vector2.ZERO
	
	## Move enemy
	coffin.sprite.move(direction)
	coffin.velocity = direction * speed
	coffin.move_and_slide()


func take_knockback(dir: Vector2):
	knockback_velocity = dir * KB_MAX
