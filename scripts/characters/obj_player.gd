extends CharacterInterface
class_name Player

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var anim_player: AnimatedSprite2D = $animPlayer
@onready var attack_area: Area2D = $attackArea
@onready var player_damage: float = 150.0
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

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
	
	anim_player.play(state)
	move_and_slide()

func _input(event: InputEvent) -> void:
	var move_direction = Input.get_axis("move_left", "move_right") * speed
	$moveComponent.direction = move_direction
	$moveComponent.execute()
	
	if Input.is_action_just_pressed("move_up"):
		$jumpComponent.execute()
	
	if Input.is_action_just_pressed("attack"):
		$attackComponent.execute()
	
	if Input.is_action_just_pressed("confirm"):
		print('confirma')

func is_on_ground() -> bool:
	return ray_cast_2d.is_colliding()

## Aplicar upgrades ##
func _apply_double_jump() -> void:
	$jumpComponent._apply_double_jump()
## Colisões
func _on_attack_area_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.death()
	elif body is Wolf:
		print("corpo é lobo")
		body.get_Damage(player_damage)

func _on_collision_area_body_entered(body: Node2D) -> void:
	if !(body is Upgrade) && body is Enemy or body is WolfAttack:
		audio.play_audio("knockout")
		randomize()
		velocity = Vector2.UP * 800.0
		velocity.rotated(randf_range(deg_to_rad(-36.0), deg_to_rad(36.0)))
		var tween :Tween = get_tree().create_tween()
		tween.tween_property(self, "rotation", randf_range(-10.0, -4.0), randf_range(0.7, 3.0))
		await get_tree().create_timer(0.5).timeout
		emit_signal("death")
	elif body is Upgrade:
		_apply_double_jump()
		body.death()
