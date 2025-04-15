extends Node2D
class_name Game
#Essa classe serve como o node principal do jogo

@export var playlist: AudioStreamPlayer 
@export var transition_screen: TransitionComponent

const INIT_MENU = preload("res://scenes/screens/init_menu.tscn") 
var current_audio: String = "null"
var current_screen: ScreenInterface
var needs_tutorial:bool = true

func _ready() -> void:
	current_screen = INIT_MENU.instantiate()
	load_screen(current_screen)

func load_screen(current_screen: ScreenInterface) -> void:
	
	if current_screen is ScreenInterface:
		add_child(current_screen)
		play_track(current_screen)
		current_screen.close_screen.connect(change_screen)
	

func play_track(current_screen: ScreenInterface) -> void:
	if current_screen:
		if current_audio != current_screen.get_Audio():
			current_audio = current_screen.get_Audio()
			playlist.stream = load(current_screen.get_Audio())
			playlist.play()
		else:
			return

func change_screen() -> void:
	print("clicado")
	var nextScreen: String = current_screen.get_NextScreen()
	if nextScreen != "null":
		transition_screen.play_anim("fade_in")
		await transition_screen.animation_end
		
		remove_child(current_screen)
		current_screen.queue_free()
		current_screen = load(nextScreen).instantiate()
		load_screen(current_screen)
		
		transition_screen.play_anim("fade_out")


func _on_playlist_finished() -> void:
	playlist.play()
