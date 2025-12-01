extends Area2D
class_name DetectionAreaComponent
const SCENE = preload("uid://blfotjsg1hqpa")

@onready var collision_circle: CollisionShape2D
@onready var life_time: Timer = $LifeTime

@export var expansion_rate: float = 1
@export var life_time_seconds: float = 4
@export var color: Color = Color.GREEN



func _ready() -> void:
	collision_circle = CollisionShape2D.new()
	collision_circle.shape = CircleShape2D.new()
	collision_circle.shape.radius = 0
	add_child.call_deferred(collision_circle)
	life_time.wait_time = life_time_seconds
	life_time.start()



func _draw():
		draw_arc(Vector2.ZERO, collision_circle.shape.radius, 0, TAU, 64, color, 1)



func _physics_process(_delta: float) -> void:
	collision_circle.shape.radius += expansion_rate
	queue_redraw()



static func get_instance(expansion_r: float = 1, life_time_s: float = 4, color_rgb: Color = Color.GREEN) -> DetectionAreaComponent:
	var instance: DetectionAreaComponent = SCENE.instantiate()
	instance.expansion_rate = expansion_r
	instance.life_time_seconds = life_time_s
	instance.color = color_rgb
	return instance



func _on_life_time_timeout() -> void:
	queue_free()
