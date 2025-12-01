extends Node2D
class_name World

func _ready() -> void:
	Context.world = self
	Log.info("World is loaded!")

func death():
	get_tree().change_scene_to_file("res://source/maps/losing_map/losing_map.tscn")
