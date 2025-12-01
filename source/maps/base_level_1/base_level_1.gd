extends Map
@onready var walls: TileMapLayer = $Walls

func ready_override():
	Context.player.music.play.call_deferred()
	walls.modulate.a = 0
	for cell in walls.get_used_cells():
		var wall: WallComponent = WallComponent.get_instance()
		wall.global_position = walls.to_global(walls.map_to_local(cell))
		add_child(wall)
