extends Node2D
class_name CoffinAttackComponent

var coffin: EnemyCoffin
@onready var area: Area2D = $DetectionArea
@onready var attack_area: Area2D = $AttackArea

func _ready() -> void:
	await owner.ready
	coffin = owner

func _physics_process(_delta: float) -> void:
	if coffin.is_dying:
		return
	
	## The code for checking overlapping areas is a bit heavy so we only run it once every 10 frames
	if not Engine.get_physics_frames() % 10 == 0:
		return
	
	
	## This code checks all the overlapping areas within it, if the player is inside it:
	## Gets the player's direction then converts it onto one of the 4 directions UP DOWN LEFT RIGHT
	## Then attacks towards that direction
	for overlapping in area.get_overlapping_areas():
		if overlapping is PlayerHurtboxComponent:
			var direction := (Context.player.global_position - global_position).normalized()
			if abs(direction.x) > abs(direction.y):
				direction = Vector2(sign(direction.x), 0)
			else:
				direction = Vector2(0, sign(direction.y))
			coffin.sprite.attack(direction)

func rotate_attack_dir(direction: Vector2):
	match direction:
		Vector2.UP:
			attack_area.position.x = 0
			attack_area.position.y = -20
		Vector2.DOWN:
			attack_area.position.x = 0
			attack_area.position.y = 20
		Vector2.RIGHT:
			attack_area.position.x = 20
			attack_area.position.y = 0
		Vector2.LEFT:
			attack_area.position.x = -20
			attack_area.position.y = 0

## TODO: FIX FUNCTIONS FROM HURTBOX
func attack_player(direction: Vector2):
	for overlapping in attack_area.get_overlapping_areas():
		if overlapping is PlayerHurtboxComponent:
			Context.player.hurtbox.take_damage(direction)
