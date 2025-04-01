extends CharacterInterface
class_name Player

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var anim_player: AnimatedSprite2D = $animPlayer

var current_state: String = "idle"

func _ready() -> void:
	state = "run"
	current_state = state
	anim_player.play(state)

func _process(delta: float) -> void:
	print("Está no chão? ", is_on_ground())
	if is_on_ground():
		if velocity.y >= 0:
			state = "run"
			velocity.y = 0
	else:
		state = "jump"
		velocity.y += gravity * delta
	
	anim_player.play(state)
	print(velocity)
	move_and_slide()

func _on_input_component_input_detected(input_vector: Vector2) -> void:
	if input_vector.y > 0: #Verifica se foi clicado o "move_down" e ignora se sim
		return
	
	if input_vector.y == -1 && is_on_ground(): #Se clicado o "move_up", chama a função de pulo do personagem
		jump()
		return
		
	velocity.x = input_vector.x * speed #direção horizontal


func _on_input_component_action_detected(action: String) -> void:
	if action == "attack":
		attack()

func jump() -> void:
	if is_on_ground():
		print("Pulei")
		state = "jump"
		velocity.y = -vSpd
	

func attack() -> void:
	state = "attacking"

func is_on_ground() -> bool:
	return ray_cast_2d.is_colliding()
