extends CharacterInterface
class_name Wolf

@export var healthComponent: HealthComponent
@onready var anim: AnimatedSprite2D = $anim
@onready var start: bool = false
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var attack_timer: Timer = $attackTimer

const OBJ_WOLF_ATTACK = preload("res://scenes/characters/obj_wolf_attack.tscn")

func _ready() -> void:
	anim.play("idle")

func _process(_delta: float) -> void:
	pass

func get_Damage(dmg: float) -> void:
	healthComponent.decrease_health(dmg)
	print(healthComponent.get_Health())

func _attack() -> void:
	play_anim_howl()
	await anim.animation_finished
	play_anim("idle")
	var timer:= get_tree().create_timer(1)
	print(timer)
	await timer.timeout
	play_anim("attack")
	var attack :Node = OBJ_WOLF_ATTACK.instantiate()
	attack.position = $AttackPosition.position
	add_child(attack)
	

## Sinais ##
func on_wolf_death() -> void:
	emit_signal("death")

func _on_helth_component_death() -> void:
	on_wolf_death()

func _on_attack_timer_timeout() -> void:
	_attack()

## Funções para animation player ##
func init_wolf() -> void:
	anim.play("idle")
	attack_timer.start()

func play_anim(anim_name: String) -> void:
	anim.play(anim_name)

func play_anim_walk() -> void:
	anim.play("walk")

func play_anim_howl() -> void:
	anim.play("howl")
	audio_stream_player.play()
