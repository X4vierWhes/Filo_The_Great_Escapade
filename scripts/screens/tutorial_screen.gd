extends ScreenInterface
class_name TutorialScreen

func _on_input_component_action_detected(action: String) -> void:
	if action == "confirm":
		emit_signal("close_screen")
		pass
