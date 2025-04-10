extends Node2D
class_name SpawnerComponent

@onready var air_spawner: Marker2D = $air_spawner
@onready var floor_spawner: Marker2D = $floor_spawner
@export var enemy_names: Array[String]

func spawn_Enemy(enemy_name: String) -> void:
	var enemy: Enemy = _get_EnemyScene(enemy_name).instantiate()
	print(enemy_name)
	if enemy_name == "crow":
		enemy.position = air_spawner.position
	else:
		enemy.position = floor_spawner.position
	
	add_child(enemy)

func _get_EnemyScene(enemy_name: String) -> PackedScene:
	var scene_path: String = "res://scenes/characters/obj_" + enemy_name + "_enemy.tscn"
	return load(scene_path)

func get_Enemy_Names() -> Array[String]:
	return enemy_names
