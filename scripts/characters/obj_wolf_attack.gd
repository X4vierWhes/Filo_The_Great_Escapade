extends Enemy
class_name WolfAttack

@onready var anim: AnimatedSprite2D = $anim

@export var collisions: Array[CollisionShape2D]

func _ready() -> void:
	speed = 250.0
	super._ready()
	$AnimationPlayer.play("new_animation")

func next_frame(id:int) -> void:
	print('cu')
