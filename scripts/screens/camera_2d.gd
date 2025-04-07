extends Camera2D
class_name GlobalCamera

var tween: Tween

func _ready() -> void:
	tween = create_tween()

func start_random_shake(strength: float = 30.0, duration: float = 1.5, steps: int = 6) -> void:
	if tween.is_running():
		tween.kill()
	
	offset = Vector2.ZERO
	tween = create_tween()
	var step_duration := duration/steps 
	
	for i in steps:
		randomize()
		var random_offset = Vector2(
			randf_range(-strength, strength),
			randf_range(-strength, strength)
		)
		tween.tween_property(self, "offset", random_offset, step_duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_property(self, "offset", Vector2.ZERO, step_duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
