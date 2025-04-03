extends Node

@onready var parent:CharacterBody2D = get_parent()

@export var attack_area:Area2D

func execute() -> void:
	if parent.is_on_ground() and !parent.isAttacking:
		parent.state = "attacking"
		parent.isAttacking = true
		attack_area.monitoring = true

func _on_anim_player_animation_finished() -> void:
	if parent.anim_player.animation == "attacking":
		print('entrei')
		parent.state = "run"
		parent.isAttacking = false
		attack_area.monitoring = false
