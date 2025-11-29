extends Node2D
class_name World

func _ready() -> void:
	Context.world = self
	Log.info("World is loaded!")
