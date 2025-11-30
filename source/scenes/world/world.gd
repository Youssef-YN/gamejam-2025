extends Node2D
class_name World

func _ready() -> void:
	Context.world = self
	Log.info("World is loaded!")

func death():
	get_tree().quit()
