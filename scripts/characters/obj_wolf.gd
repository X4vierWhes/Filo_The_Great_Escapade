extends CharacterInterface
class_name Wolf

@export var healthComponent: HealthComponent
@onready var anim: AnimatedSprite2D = $anim
@onready var start: bool = false
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	anim.play("idle")

func _process(delta: float) -> void:
	if start:
		pass
	else:
		pass

func get_Damage(dmg: float) -> void:
	healthComponent.decrease_health(dmg)
	print(healthComponent.get_Health())

func on_wolf_death() -> void:
	emit_signal("death")

func init_wolf() -> void:
	anim.play("idle")
	start = !start

func play_anim(anim_name: String) -> void:
	anim.play(anim_name)

func play_anim_walk() -> void:
	anim.play("walk")

func play_anim_howl() -> void:
	anim.play("howl")
	audio_stream_player.play()


func _on_helth_component_death() -> void:
	on_wolf_death()
