extends Area2D
class_name CoffinDetectionComponent

@onready var timer: Timer = $VisibleTimer
var wait_time: float = 3.

var coffin: EnemyCoffin

func _ready() -> void:
	await owner.ready
	coffin = owner

func _on_area_entered(area: Area2D) -> void:
	if area is DetectionAreaComponent:
		coffin.is_shown = true
		timer.stop()
		timer.wait_time = wait_time
		timer.start()


func _on_visible_timer_timeout() -> void:
	coffin.is_shown = false
