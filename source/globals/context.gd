extends Node


## Context variables, these variables are referenced a lot.
## So instead of using dependency injection, we make them public and accessible.
var root: Root
var world: World
var player: Player
