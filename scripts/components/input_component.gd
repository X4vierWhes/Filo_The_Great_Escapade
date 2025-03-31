class_name InputComponent extends Node2D

signal input_detected(input_vector: Vector2)
signal action_detected(action: String)

func _process(delta: float) -> void:
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	emit_signal("input_detected", input)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		emit_signal("action_detected", "attack")
	
	if event.is_action_pressed("confirm"):
		emit_signal("action_detected", "confirm")
