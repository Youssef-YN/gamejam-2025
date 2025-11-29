extends Node
class_name Root
## The root node is the root of the whole game.
## All nodes are children of this node.
## This node also functions as a router.
## Meaning scene switching, map switching... will happen here.


func _ready() -> void:
	Context.root = self
	Log.info("Root is loaded!")
