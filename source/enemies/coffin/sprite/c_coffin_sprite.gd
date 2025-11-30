extends AnimatedSprite2D
class_name CoffinSpriteComponent

var previous_direction: Vector2 = Vector2.DOWN
var is_attacking: bool = false

var coffin: EnemyCoffin

func _ready() -> void:
	await owner.ready
	coffin = owner


func move(direction: Vector2) -> void:
	## If the coffin is attacking, manbghiwch had l animations y overridiw l attack animation
	if is_attacking or coffin.is_dying:
		return
	
	## If the direction isn't null, apply the movement
	coffin.attack.rotate_attack_dir(direction)
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
			## If the direction is null, apply the previous direction's animation
			if direction == Vector2.ZERO:
				match previous_direction:
					Vector2.UP:
						play("idle_up")
					Vector2.DOWN:
						play("idle_down")
					Vector2.RIGHT:
						flip_h = false
						play("idle_right")
					Vector2.LEFT:
						flip_h = true
						play("idle_right")


func attack(direction: Vector2):
	## If coffin is already attacking, we wouldn't want it to play the animation again
	if is_attacking or coffin.is_dying:
		return
	
	coffin.attack.rotate_attack_dir(direction)
	## This code is a bit long but easy to understand
	## First we set the previous direction in case we need to use it for idle
	## Secondly, we check if we have to flip horizontally or not, only case we need to do this in is LEFT
	## Third we play the animation and wait until it's finished
	## Finally we turn is attacking to false
	
	is_attacking = true
	match direction:
		Vector2.UP:
			previous_direction = Vector2.UP
			flip_h = false
			play("attack_up")
			await animation_finished
			is_attacking = false
		Vector2.DOWN:
			previous_direction = Vector2.DOWN
			flip_h = false
			play("attack_down")
			await animation_finished
			is_attacking = false
		Vector2.RIGHT:
			previous_direction = Vector2.RIGHT
			flip_h = false
			play("attack_right")
			await animation_finished
			is_attacking = false
		Vector2.LEFT:
			previous_direction = Vector2.LEFT
			flip_h = true
			play("attack_right")
			await animation_finished
			is_attacking = false



func _on_frame_changed() -> void:
	if frame == 3:
		coffin.attack.attack_player(previous_direction)
