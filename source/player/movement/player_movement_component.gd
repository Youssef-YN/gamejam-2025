extends Node2D
class_name PlayerMovementComponent

var speed = 150.0
var knockback_velocity: Vector2 = Vector2.ZERO
const KB_DECAY: float = 600.
const KB_MAX: float = 150.
const PUSH_FORCE: float = 10
var is_vertical: bool = false


var player: Player

func _ready() -> void:
	await get_parent().ready


func _physics_process(delta: float) -> void:
	if player.is_dying:
		return
		
	## Manage KB
	if knockback_velocity.length() > 0.:
		owner.velocity = knockback_velocity
		knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, KB_DECAY * delta)
		owner.move_and_slide()
		return

	## Get Direction vector (WARNING: This can hold a value other than 1 or 0 in the axis, which is why I included the next part)
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var sprite_dir: Vector2 = Vector2.ZERO
	
	## Stops player from moving if attacking
	if player.sprite.is_attacking:
		direction = Vector2.ZERO
	
	## If the player moves diagonally after shooting, the sprite freezes because the direction goes from ZERO to a non integer value (comment out this next code section to see the difference)
	## This part of code aims to fix that, if you comment out the code you can replace the sprite.move(sprite_dir) to just direction
	if abs(direction.x) > abs(direction.y) * 1.2:
		is_vertical = false
		sprite_dir = Vector2(sign(direction.x), 0)
	elif abs(direction.y) > abs(direction.x) * 1.2:
		is_vertical = true
		sprite_dir = Vector2(0, sign(direction.y))
	else:
		sprite_dir = Vector2(0, sign(direction.y)) if is_vertical else Vector2(sign(direction.x), 0)
	
	player.sprite.move(sprite_dir)
	player.velocity = direction * speed
	player.move_and_slide()


func take_knockback(direction: Vector2) -> void:
	knockback_velocity = direction * KB_MAX
