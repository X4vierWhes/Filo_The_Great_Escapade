extends CharacterInterface
class_name Player

@onready var anim_player: AnimatedSprite2D = $animPlayer
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	anim_player.play("run")

func _process(delta: float) -> void:
	velocity = direction * speed
	velocity.normalized()
	move_and_slide()

func jump() -> void:
	print("pulei")

func _on_input_component_input_detected(input_vector: Vector2) -> void:
	if input_vector.y > 0:
		return
	
	if input_vector.y == -1:
		jump()
		return
	
	direction = input_vector
