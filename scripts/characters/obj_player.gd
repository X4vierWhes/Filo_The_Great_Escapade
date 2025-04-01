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

func _on_input_component_input_detected(input_vector: Vector2) -> void:
	if input_vector.y > 0: #Verifica se foi clicado o "move_down" e ignora se sim
		return
	
	if input_vector.y == -1: #Se clicado o "move_up", chama a função de pulo do personagem
		jump()
		return
	
	input_vector.y = 0 #existe um bug em que se apertar para cima e para algum lado o player sobe
	direction = input_vector 


func _on_input_component_action_detected(action: String) -> void:
	if action == "attack":
		attack()

func jump() -> void:
	print("pulei")

func attack() -> void:
	print("ataquei")
