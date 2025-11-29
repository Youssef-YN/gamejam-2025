extends AnimatedSprite2D
class_name PlayerSpriteComponent

var is_attacking: bool = false
var previous_direction: Vector2 = Vector2.DOWN
var player: Player

func _ready() -> void:
	await get_parent().ready


func move(direction: Vector2) -> void:
	if is_attacking or player.is_dying:
		return
	match direction:
		Vector2.UP:
			flip_h = false
			play("run_up")
			previous_direction = Vector2.UP
		Vector2.DOWN:
			flip_h = false
			play("run_down")
			previous_direction = Vector2.DOWN
		Vector2.RIGHT:
			flip_h = false
			play("run_right")
			previous_direction = Vector2.RIGHT
		Vector2.LEFT:
			flip_h = true
			play("run_right")
			previous_direction = Vector2.LEFT
		_:
			if direction == Vector2.ZERO:
				match previous_direction:
					Vector2.UP:
						play("idle_up")
					Vector2.DOWN:
						play("idle_down")
					Vector2.LEFT:
						flip_h = true
						play("idle_right")
					Vector2.RIGHT:
						flip_h = false
						play("idle_right")
			else:
				pass

func attack(direction: Vector2):
	if is_attacking or player.is_dying:
		return
	
	is_attacking = true
	match direction:
		Vector2.UP:
			previous_direction = Vector2.UP
			flip_h = false
			position.x = 1
			play("shoot_up")
			await animation_finished
			is_attacking = false
		Vector2.DOWN:
			previous_direction = Vector2.DOWN
			flip_h = false
			position.x = 1
			play("shoot_down")
			await animation_finished
			is_attacking = false
		Vector2.RIGHT:
			previous_direction = Vector2.RIGHT
			position.x = 1
			flip_h = false
			play("shoot_right")
			await animation_finished
			is_attacking = false
		Vector2.LEFT:
			previous_direction = Vector2.LEFT
			position.x = -1
			flip_h = true
			play("shoot_right")
			await animation_finished
			is_attacking = false
