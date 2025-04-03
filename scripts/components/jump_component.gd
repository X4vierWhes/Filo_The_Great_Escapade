extends Node

@onready var parent:CharacterBody2D = get_parent()

var max_teste:int = 2
var teste:int = 2

func _physics_process(delta: float) -> void:
	if teste < max_teste:
		if parent.is_on_ground(): teste = max_teste


func execute() -> void:
	if parent.isAttacking:
		return
	
	if teste <= 0:
		return
	
	parent.state = "jump"
	parent.velocity.y = -parent.vSpd
	teste-=1
