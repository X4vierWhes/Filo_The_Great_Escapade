extends ScreenInterface
class_name TutorialScreen

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm"):
		get_parent().needs_tutorial = false
		emit_signal("close_screen")
		pass
