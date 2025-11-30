extends Node2D
class_name CoffinMovementComponent

var speed = 60.0
var vertical: bool = true

var coffin: EnemyCoffin

func _ready() -> void:
	await owner.ready
	coffin = owner


func _physics_process(_delta: float) -> void:
	## Get the position of player
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
	
	## Animated movement and change speed
	coffin.sprite.move(direction)
	coffin.velocity = direction * speed
	
	## Only move if visible
	if coffin.is_shown:
		coffin.move_and_slide()
