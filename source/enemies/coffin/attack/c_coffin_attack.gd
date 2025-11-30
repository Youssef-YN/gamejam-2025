extends Node2D
class_name CoffinAttackComponent

var coffin: EnemyCoffin
@onready var attack_area: Area2D = $AttackArea

func _ready() -> void:
	await owner.ready
	coffin = owner

func _physics_process(_delta: float) -> void:
	
	## The code for checking overlapping areas is a bit heavy so we only run it once every 10 frames
	if not Engine.get_physics_frames() % 10 == 0:
		return
	
	## Checks if player entered area, if so, kills the player
	for overlapping in attack_area.get_overlapping_areas():
		if overlapping is PlayerHurtboxComponent:
			Context.world.death()
