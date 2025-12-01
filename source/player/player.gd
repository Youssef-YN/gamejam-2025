extends CharacterBody2D
class_name Player

## Components
@onready var sprite: PlayerSpriteComponent = $PlayerSpriteComponent
@onready var attack: PlayerAttackComponent = $PlayerAttackComponent
@onready var collision: PlayerCollisionComponent = $PlayerCollisionComponent
@onready var camera: PlayerCameraComponent = $PlayerCameraComponent
@onready var movement: PlayerMovementComponent = $PlayerMovementComponent
@onready var music: BackgroundMusicComponent = $Backgroundmusic



var is_dying: bool = false



func _ready() -> void:
	Context.player = self
	_assign_self()
	Log.info("Player is loaded!")



## Check if a child has the player var reference.
## If so, add the player instance to it
func _assign_self() -> void:
	for child in get_children():
		if "player" in child:
			child.player = self
