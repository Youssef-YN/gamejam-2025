extends Area2D
class_name CoffinHurtboxComponent

var coffin: EnemyCoffin

func _ready() -> void:
	await owner.ready
	coffin = owner

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is Bullet:
		coffin.queue_free()
