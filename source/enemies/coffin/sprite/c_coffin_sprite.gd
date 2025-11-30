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
