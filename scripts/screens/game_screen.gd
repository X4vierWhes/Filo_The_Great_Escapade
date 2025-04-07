extends ScreenInterface
class_name GameScreen

const OBJ_PLAYER = preload("res://scenes/characters/obj_player.tscn")

@export var player_spawn: Marker2D
@export var label: RichTextLabel
@export var spawner: SpawnerComponent
@export var dist: int = 0
@export var anim_player: AnimationPlayer

@onready var dist_timer: Timer = $DistTimer
@onready var spawner_timer: Timer = $spawnerTimer
@onready var enemy_names: Array[String]
@onready var obj_wolf: Wolf = $CanvasLayer/Control/obj_Wolf
@onready var parallax_background: Parallax = $ParallaxBackground

var wolf_spawned: bool = false
func _ready() -> void:
	obj_wolf.death.connect(_on_wolf_death)
	var player: Player = OBJ_PLAYER.instantiate()
	player.position.x = player_spawn.position.x
	player.position.y = player_spawn.position.y
	player.death.connect(_on_player_death)
	add_child(player)
	enemy_names = spawner.get_Enemy_Names()
	print(enemy_names)
	_spawn_enemy_with_random_delay()

func _process(delta: float) -> void:
	if dist == 300 and not wolf_spawned:
		spawner_timer.stop()
		dist_timer.stop()
		parallax_background.stop()
		anim_player.play("wolf_entered")
		await anim_player.animation_finished
		anim_player.queue_free()
		obj_wolf.position.x = 1031.0
		wolf_spawned = true
	

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
	emit_signal("close_screen")

func _on_wolf_death() -> void:
	set_NextScreen("win_screen")
	emit_signal("close_screen")
