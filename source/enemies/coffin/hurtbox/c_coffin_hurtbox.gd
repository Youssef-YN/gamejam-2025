extends Area2D
class_name CoffinHurtboxComponent

var coffin: EnemyCoffin

func _ready() -> void:
	await owner.ready
	coffin = owner

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is Bullet:
		var hit: DetectionAreaComponent = DetectionAreaComponent.get_instance(1.5, 5, Color.RED)
		hit.global_position = global_position
		Context.world.add_child(hit)
		coffin.queue_free()
		area.get_parent().queue_free()
