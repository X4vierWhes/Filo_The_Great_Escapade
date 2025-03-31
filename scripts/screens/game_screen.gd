extends ScreenInterface
class_name GameScreen

const OBJ_PLAYER = preload("res://scenes/characters/obj_player.tscn")
@onready var marker_2d: Marker2D = $CanvasLayer/Control/Marker2D



func _ready() -> void:
	var player: Player = OBJ_PLAYER.instantiate()
	player.position.x = marker_2d.position.x
	player.position.y = marker_2d.position.y
	add_child(player)
