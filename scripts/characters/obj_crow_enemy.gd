extends Enemy

var time:float = 0.0


func _physics_process(delta: float) -> void:
	time += delta
	velocity.y = sin(time * 5.0) * 300.0
	#print(velocity.y)
	move_and_slide()


func _play_sound() -> void:
	$AudioStreamPlayer.play_audio("flap")
	$Timer.start(randi_range(0.8, 2.0))


func _on_attack_range_area_entered(area: Area2D) -> void:
	print('entrei')
	$AudioStreamPlayer.play_audio("attack")
