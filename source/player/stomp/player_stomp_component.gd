extends Node2D
class_name PlayerStompComponent

@onready var cooldown_timer: Timer = $Cooldown

@export var cooldown_length: float = 5
var can_stomp: bool = true

var player: Player

func _ready() -> void:
	await get_parent().ready
	cooldown_timer.wait_time = cooldown_length

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("stomp"):
		stomp()


## Checks if the player can stomp, then gets the player's global position
## And adds the stomp effect to the world.
## The reason why we add it to the world and not the player is because if we add it to the player, the stomp effect will move with the player
## Then since we just stomped we set can stomp is false, then set a timer to enablet it back after it's done
func stomp() -> void:
	if can_stomp:
		var area: DetectionAreaComponent = DetectionAreaComponent.get_instance(1.5, 3)
		area.global_position = player.global_position
		Context.world.add_child(area)
		can_stomp = false
		cooldown_timer.start()


func _on_cooldown_timeout() -> void:
	can_stomp = true
