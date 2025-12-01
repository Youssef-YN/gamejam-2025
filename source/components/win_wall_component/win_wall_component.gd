extends Node2D
class_name WinWallComponent

@onready var timer: Timer = $VisibilityTimer

func _ready() -> void:
	visible = false



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is DetectionAreaComponent:
		timer.stop()
		visible = true
		timer.start()
	
	if area is PlayerHurtboxComponent:
		Context.root.load_map(Context.root.WIN_MAP)



func _on_visibility_timer_timeout() -> void:
	visible = false
