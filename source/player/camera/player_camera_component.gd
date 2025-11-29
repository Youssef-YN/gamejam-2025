extends Camera2D
class_name PlayerCameraComponent

var player: Player

func _ready() -> void:
	await get_parent().ready
