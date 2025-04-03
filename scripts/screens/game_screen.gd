extends ScreenInterface
class_name GameScreen

const OBJ_PLAYER = preload("res://scenes/characters/obj_player.tscn")

@export var marker_2d: Marker2D
@export var label: RichTextLabel
@export var spawner: SpawnerComponent
@export var dist: int = 0
@onready var dist_timer: Timer = $DistTimer
@onready var spawner_timer: Timer = $spawnerTimer
@onready var enemy_names: Array[String]

func _ready() -> void:
	var player: Player = OBJ_PLAYER.instantiate()
	player.position.x = marker_2d.position.x
	player.position.y = marker_2d.position.y
	player.death.connect(_on_player_death)
	add_child(player)
	enemy_names = spawner.get_Enemy_Names()
	print(enemy_names)
	_spawn_enemy_with_random_delay()

func _process(delta: float) -> void:
	if dist == 300:
		spawner_timer.stop()
		dist_timer.stop()

func attDist() -> void:
	dist+=1
	var textLabel: String = "[pulse freq=2.0 color=#ffffff40 ease=-2.0]" + str(dist) + "[/pulse]"
	label.text = textLabel

func _on_dist_timer_timeout() -> void:
	attDist()

func _on_spawner_timer_timeout() -> void:
	if enemy_names.is_empty():
		return
	
	randomize()
	var enemy_name: String = enemy_names[randi() % enemy_names.size()]
	
	spawner.spawn_Enemy(enemy_name)
	
	_spawn_enemy_with_random_delay()

func _spawn_enemy_with_random_delay() -> void:
	randomize()
	var random_time: float = randf_range(1.0, 3.0)
	spawner_timer.start(random_time)

func _on_player_death() -> void:
	set_NextScreen("game_over_screen")
	print(next_screen)
	emit_signal("close_screen")
