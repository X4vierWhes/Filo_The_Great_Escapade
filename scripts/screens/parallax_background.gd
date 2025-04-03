extends Node2D
class_name Parallax

func stop() -> void:
	var background: Parallax2D = get_child(0)
	background.autoscroll.x = 0.0
	var road: Parallax2D = get_child(1)
	road.autoscroll.x = 0.0
