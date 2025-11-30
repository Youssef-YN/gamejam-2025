extends Node2D
class_name CoffinHealthComponent
#const PIXEL_MELTING = preload("uid://brf1sy6abc662")

const MAX_HP: int = 4
var hp: int

var coffin: EnemyCoffin

func _ready() -> void:
	await owner.ready
	coffin = owner

	hp = MAX_HP

func take_damage():
	hp -= 1
	if hp <= 0:
		_death()

func _death():
	coffin.is_dying = true
	coffin.sprite.play("death")
	#var material_instance = PIXEL_MELTING.duplicate(true)
	#coffin.sprite.material = material_instance
	#material_instance.set_shader_parameter("animation_progress", 0.0)
	#var tween := create_tween()
	#tween.tween_method(func(value):material_instance.set_shader_parameter("animation_progress", value), 0.0, 1.0, 2)
	#await tween.finished
	await coffin.sprite.animation_finished
	coffin.queue_free()
