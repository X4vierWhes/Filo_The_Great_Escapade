extends Node

var direction:float = 0.0

@onready var parent:CharacterBody2D = get_parent()

func execute() -> void:
	parent.velocity.x = direction
