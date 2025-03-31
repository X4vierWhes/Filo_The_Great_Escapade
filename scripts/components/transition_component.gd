extends CanvasLayer
class_name TransitionComponent

@onready var color = $Control/ColorRect
@onready var animation = $AnimationPlayer

signal transition_finished

func _ready() -> void:
	color.visible = false
	animation.animation_finished.connect(transition_anim)

func transition_anim(anim_name: String) -> void:
	if anim_name == "fade_out":
		transition_finished.emit()
		animation.play("fade_in")
	elif anim_name == "fade_in":
		color.visible = false

func transition() -> void:
	color.visible = true
	animation.play("fade_out")
