extends Map

func ready_override():
	Context.player.camera.is_shader_on = false
	Context.player.camera.zoom = Vector2.ONE * 2
	Context.player.attack.is_showing_line = false
