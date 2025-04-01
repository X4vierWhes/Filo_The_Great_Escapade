extends ScreenInterface
class_name GameScreen

const OBJ_PLAYER = preload("res://scenes/characters/obj_player.tscn")
@export var marker_2d: Marker2D
@export var label: RichTextLabel
@export var dist: int = 0

func _ready() -> void:
	var player: Player = OBJ_PLAYER.instantiate()
	player.position.x = marker_2d.position.x
	player.position.y = marker_2d.position.y
	add_child(player)

func attDist() -> void:
	dist+=1
	var textLabel: String = "[pulse freq=2.0 color=#ffffff40 ease=-2.0]" + str(dist) + "[/pulse]"
	label.text = textLabel

func _on_dist_timer_timeout() -> void:
	attDist()
