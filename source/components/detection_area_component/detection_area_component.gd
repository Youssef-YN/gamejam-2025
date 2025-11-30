extends Area2D
class_name DetectionAreaComponent
const SCENE = preload("uid://blfotjsg1hqpa")

@onready var collision_circle: CollisionShape2D = $CollisionCircle
@onready var life_time: Timer = $LifeTime

@export var expansion_rate: int = 1
@export var life_time_seconds: int = 4



func _ready() -> void:
	life_time.wait_time = life_time_seconds
	life_time.start()



func _draw():
	draw_arc(Vector2.ZERO, collision_circle.shape.radius, 0, TAU, 64, Color.RED, 1)



func _physics_process(_delta: float) -> void:
	collision_circle.shape.radius += expansion_rate
	queue_redraw()



func get_instance(expansion_r: int = 1, life_time_s: int = 4) -> DetectionAreaComponent:
	var instance: DetectionAreaComponent = SCENE.instantiate()
	instance.expansion_rate = expansion_r
	instance.life_time_seconds = life_time_s
	return instance



func _on_life_time_timeout() -> void:
	queue_free()
