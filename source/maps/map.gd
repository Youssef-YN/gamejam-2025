extends Node2D
class_name Map
const PLAYER = preload("uid://d207crbenrx2g")
const COFFIN = preload("uid://dnbxm86ac8xy8")

@export var player_spawn: Marker2D
@export var enemy_spawns: Node


func ready_override():
	pass



func _ready() -> void:
	_spawn_player()
	_spawn_enemy()
	ready_override()



func _spawn_player() -> void:
	if not player_spawn:
		return
	var player: Player = PLAYER.instantiate()
	player.global_position = player_spawn.global_position
	Context.world.add_child(player)

func _spawn_enemy() -> void:
	if not enemy_spawns:
		return
	for child in enemy_spawns.get_children():
		var coffin: EnemyCoffin = COFFIN.instantiate()
		coffin.global_position = child.global_position
		Context.world.add_child(coffin)
