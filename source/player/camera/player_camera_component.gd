extends Camera2D
class_name PlayerCameraComponent
@onready var shader_rect: ColorRect = $CanvasLayer/ColorRect

@export var is_shader_on: bool = true:
	set(value):
		_is_shader_on = value
		if shader_rect:
			shader_rect.visible = value
	get:
		return _is_shader_on

var _is_shader_on: bool = true

var player: Player

func _ready() -> void:
	await get_parent().ready
	shader_rect.visible = is_shader_on
