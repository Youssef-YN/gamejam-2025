extends CollisionShape2D
class_name PlayerCollisionComponent

var player: Player

func _ready() -> void:
	await get_parent().ready
