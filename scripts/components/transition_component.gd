extends CanvasLayer
class_name TransitionComponent

@onready var color = $Control/ColorRect
@onready var animation = $AnimationPlayer

signal animation_end

func play_anim(anim_name: String) -> void:
	animation.play(anim_name)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("fim")
	emit_signal("animation_end")
