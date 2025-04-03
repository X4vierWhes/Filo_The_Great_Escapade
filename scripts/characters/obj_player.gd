extends CharacterInterface
class_name Player

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var anim_player: AnimatedSprite2D = $animPlayer
@onready var attack_area: Area2D = $attackArea

func _ready() -> void:
	state = "run"
	anim_player.play(state)

func _process(delta: float) -> void:
	if is_on_ground() and not isAttacking:
		if velocity.y >= 0:
			state = "run"
			velocity.y = 0
	elif not is_on_ground():
		state = "jump"
		velocity.y += gravity * delta
	
	#print(state)
	anim_player.play(state)
	move_and_slide()

func _on_input_component_input_detected(input_vector: Vector2) -> void:
	if input_vector.y > 0: #Verifica se foi clicado o "move_down" e ignora se sim
		return
	
	if input_vector.y == -1 && is_on_ground(): #Se clicado o "move_up", chama a função de pulo do personagem
		jump()
	
	velocity.x = input_vector.x * speed #direção horizontal


func _on_input_component_action_detected(action: String) -> void:
	if action == "attack":
		attack()

func jump() -> void:
	if !isAttacking:
		#print("Pulei")
		state = "jump"
		velocity.y = -vSpd
	

func attack() -> void:
	if is_on_ground() and !isAttacking:
		#print("atacou")
		state = "attacking"
		isAttacking = !isAttacking
		attack_area.get_child(0).disabled = false
	elif isAttacking:
		attack_area.get_child(0).disabled = true

func is_on_ground() -> bool:
	return ray_cast_2d.is_colliding()


func _on_anim_player_animation_finished() -> void:
	if anim_player.animation == "attacking":
		attack()
		isAttacking = !isAttacking
		state = "run"


func _on_attack_area_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.death()


func _on_collision_area_body_entered(body: Node2D) -> void:
	if body is Enemy:
		emit_signal("death")
