extends Node2D
class_name CoffinHealthComponent

const MAX_HP: int = 1
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
	await coffin.sprite.animation_finished
	coffin.queue_free()
