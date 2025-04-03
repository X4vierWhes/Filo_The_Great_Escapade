extends Enemy
class_name WolfAttack

@onready var anim: AnimatedSprite2D = $anim

func _ready() -> void:
	anim.play("run")
	
