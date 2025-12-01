extends Map
const ROOT = preload("uid://blut7g0bpjqdp")

func ready_override():
	Context.player.camera.is_shader_on = false
	Context.player.camera.zoom = Vector2.ONE * 2
	Context.player.sprite.modulate = Color.WHITE
	Context.player.attack.is_showing_line = false


func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_packed(ROOT)
