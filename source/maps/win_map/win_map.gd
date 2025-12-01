extends Map

func ready_override():
	Context.player.camera.is_shader_on = false
	Context.player.attack.is_showing_line = false
	Context.player.sprite.modulate = Color.WHITE

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/root/root.tscn")
