extends Node

@onready var parent:CharacterBody2D = get_parent()

func execute() -> void:
	if parent.isAttacking or !parent.is_on_ground():
		return
	
	parent.state = "jump"
	parent.velocity.y = -parent.vSpd
	parent.audio.play_audio("jump")
