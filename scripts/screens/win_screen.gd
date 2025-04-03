extends ScreenInterface
class_name WinScreen

@onready var texture_rect: TextureRect = $CanvasLayer/Control/TextureRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("crown")

func _on_input_component_action_detected(action: String) -> void:
	if action == "confirm":
		emit_signal("close_screen")
	pass

func _on_flip_timer_timeout() -> void:
	texture_rect.flip_h = !texture_rect.flip_h

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	animation_player.play("crown")
