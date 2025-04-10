extends Node

@onready var parent:CharacterBody2D = get_parent()

var max_jump:int = 2
var jump:int = 2

func _physics_process(delta: float) -> void:
	if jump < max_jump:
		if parent.is_on_ground(): 
			jump = max_jump
			print('entrei')


func execute() -> void:
	print(jump)
	if parent.isAttacking:
		return
	
	if jump <= 0:
		return
	
	parent.state = "jump"
	# extremamente horroroso mas se não tiver essa linha ele sempre vai dar um pulo a mais
	parent.position.y -= 16 
	parent.velocity.y = -parent.vSpd
	
	if jump == max_jump:
		parent.audio.play_audio('jump')
	else:
		parent.audio.play_audio('doublejump')
	
	jump-=1
