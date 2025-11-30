extends CharacterBody2D
class_name EnemyCoffin
@onready var movement: CoffinMovementComponent = $CCoffinMovement
@onready var collision: CollisionShape2D = $CCoffinCollision
@onready var sprite: CoffinSpriteComponent = $CCoffinSprite
@onready var health: CoffinHealthComponent = $CCoffinHealth
@onready var attack: CoffinAttackComponent = $CCoffinAttack

@onready var is_dying: bool = false
