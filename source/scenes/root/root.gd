extends Node
class_name Root
## The root node is the root of the whole game.
## All nodes are children of this node.
## This node also functions as a router.
## Meaning scene switching, map switching... will happen here.

const WORLD = preload("uid://cb5d3qjslwhhp")
const BASE_LEVEL_1 = preload("uid://fcehxpog6t32")
const MENU = preload("uid://dq5x2teh42hue")


func _ready() -> void:
	Context.root = self
	Log.info("Root is loaded!")
	load_map(MENU)



static func clear(node: Node):
	for child in node.get_children():
		child.queue_free()



func load_world() -> void:
	clear(self)
	var world: World = WORLD.instantiate()
	add_child(world)



func load_map(scene: PackedScene) -> void:
	load_world()
	var map: Node = scene.instantiate()
	Context.world.add_child(map)
