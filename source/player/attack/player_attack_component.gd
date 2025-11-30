extends Node2D
class_name PlayerAttackComponent
@onready var bullet_sound: AudioStreamPlayer2D = $BulletSound
@onready var line: Line2D = $ShootLine

var player: Player

@export var is_showing_line: bool = true:
	set(value):
		_is_showing_line = value
		if line:
			line.visible = is_showing_line
	get:
		return _is_showing_line

var _is_showing_line: bool = true


func _ready() -> void:
	await get_parent().ready
	line.visible = is_showing_line


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		## Get the mouse position
		var direction: Vector2 = (get_global_mouse_position() - global_position)
		if abs(direction.x) > abs(direction.y):
			direction = Vector2(sign(direction.x), 0)
		else:
			direction = Vector2(0, sign(direction.y))
		Context.player.sprite.attack(direction)
	
	if event is InputEventMouseMotion:
		line.points[-1] = (get_global_mouse_position() - global_position) * 100

func attack(direction: Vector2) -> void:
	var bullet: Bullet = Bullet.shoot(direction)
	bullet.global_position = global_position
	Context.world.add_child(bullet)
	bullet_sound.play()
