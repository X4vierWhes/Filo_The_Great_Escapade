class_name Enemy extends CharacterBody2D

#@export var velocity:float = 585
@export var speed:float = 100

func _ready() -> void:
	velocity = Vector2.LEFT * speed

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func death() -> void:
	queue_free()
