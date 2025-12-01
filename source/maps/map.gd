extends Node2D
class_name Map
const PLAYER = preload("uid://d207crbenrx2g")

@export var player_spawn: Marker2D



func ready_override():
	pass



func _ready() -> void:
	_spawn_player()
	ready_override()



func _spawn_player() -> void:
	var player: Player = PLAYER.instantiate()
	player.global_position = player_spawn.global_position
	Context.world.add_child(player)
