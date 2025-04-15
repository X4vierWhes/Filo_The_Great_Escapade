extends ScreenInterface
class_name InitMenu

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm"):
		if !get_parent().needs_tutorial:
			next_screen = "game_screen"
		emit_signal("close_screen")
		pass
