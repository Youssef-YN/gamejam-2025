extends StaticBody2D
class_name WallComponent
const SCENE = preload("uid://d1el5gfyfitfi")
@onready var timer: Timer = $VisibilityTimer

func _ready() -> void:
	visible = false

static func get_instance() -> WallComponent:
	var instance = SCENE.instantiate()
	return instance


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Bullet:
		area.get_parent().queue_free()
		var hit: DetectionAreaComponent = DetectionAreaComponent.get_instance(2, 1)
		hit.global_position = global_position
		Context.world.add_child(hit)
	
	if area is DetectionAreaComponent:
		timer.stop()
		visible = true
		timer.start()



func _on_visibility_timer_timeout() -> void:
	visible = false
