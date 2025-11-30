extends Area2D
class_name CoffinHurtboxComponent

var coffin: EnemyCoffin

func _ready() -> void:
	await owner.ready
	coffin = owner

func _on_area_entered(area: Area2D) -> void:
	Log.debug("Coffin area entered")
	#if coffin.is_dying:
		#return
	#if area is Bullet:
		#take_damage(area)

func take_damage(area: Area2D):
	Log.debug("Coffin Took Damage")
		#coffin.movement.take_knockback(area.direction)
		#Utils.damage_modulate(coffin.sprite)
		#coffin.health.take_damage()
		#area.queue_free()
