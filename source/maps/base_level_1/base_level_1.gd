extends Map
@onready var walls: TileMapLayer = $Walls

func ready_override():
	walls.modulate.a = 0
	for cell in walls.get_used_cells():
		var wall: WallComponent = WallComponent.get_instance()
		wall.global_position = walls.to_global(walls.map_to_local(cell))
		add_child(wall)
