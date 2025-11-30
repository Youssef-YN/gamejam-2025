extends Node2D
class_name Bullet
const BULLET = preload("uid://cjjrwlhg846qc")


var direction: Vector2 = Vector2.RIGHT
var speed: float = 200.

func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _process(delta: float) -> void:
	translate(direction * delta * speed)

static func shoot(_direction: Vector2) -> Bullet:
	var bullet: Bullet = BULLET.instantiate()
	bullet.direction = _direction
	bullet.rotation = _direction.angle()
	return bullet
