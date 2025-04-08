extends AudioStreamPlayer

@export var audio_playlist:Dictionary

var audio_files:Array[AudioStreamWAV]

func play_audio(name:StringName) -> bool:
	if !audio_playlist.has(name):
		return false
	
	stream = audio_playlist[name]
	play()
	return true
