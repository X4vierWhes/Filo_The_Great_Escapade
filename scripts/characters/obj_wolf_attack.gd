extends Enemy
class_name WolfAttack

@onready var anim: AnimatedSprite2D = $anim

func _ready() -> void:
	speed = 250.0
	super._ready()
	anim.play("run")
	
