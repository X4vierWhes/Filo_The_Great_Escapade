extends Node2D
class_name ScreenInterface

@export var screen_audio: String = "Main_Music"
@export var next_screen: String = "null"

signal close_screen

func get_Audio() -> String:
	return "res://resources/audios/" + screen_audio + ".wav"

func get_NextScreen() -> String:
	if next_screen != "null":
		return "res://scenes/screens/" + next_screen + ".tscn"
	
	return next_screen
