extends Node
class_name PlayerComponent

var player: Player

func _ready() -> void:
	await get_parent().ready
	ready_override()

func ready_override():
	pass
