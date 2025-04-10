extends Enemy
class_name Upgrade

func death() -> void:
	queue_free()
