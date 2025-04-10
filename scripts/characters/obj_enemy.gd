class_name Enemy extends CharacterBody2D

#@export var velocity:float = 585
@export var speed:float = 100
@onready var direction: Vector2 = Vector2.LEFT
var _death: bool = false

func _ready() -> void:
	velocity = Vector2.LEFT * speed

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func death() -> void:
	_death = true
	$AudioStreamPlayer.play_audio("knockout")
	$anim.visible = false
	$collision.set_deferred("disabled", true)
	$AudioStreamPlayer.finished.connect(func():
		queue_free()
		)
	
	$AudioStreamPlayer.finished.connect(func():
		queue_free()
		)
	for i in get_children():
		if i != $AudioStreamPlayer:
			i.queue_free()
