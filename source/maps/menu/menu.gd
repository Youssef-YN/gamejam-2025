extends Map

func ready_override():
	Context.player.camera.is_shader_on = false
	Context.player.camera.zoom = Vector2.ONE * 2
	Context.player.sprite.modulate = Color.WHITE
	Context.player.attack.is_showing_line = false


func _on_play_pressed() -> void:
	Context.root.load_map(Context.root.BASE_LEVEL_1)




func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_info_pressed() -> void:
	Context.root.load_map(Context.root.INFO_ROOM)
