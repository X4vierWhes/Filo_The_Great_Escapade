extends Enemy

var time:float = 0.0

func _physics_process(delta: float) -> void:
	time += delta
	velocity.y = sin(time * 5.0) * 300.0
	#print(velocity.y)
	move_and_slide()
