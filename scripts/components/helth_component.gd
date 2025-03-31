extends Node2D
class_name HealthComponent

signal death

@export var max_health_value: float = 100.0
@onready var health: float = 0.0
@export var health_bar: ProgressBar

func _ready() -> void:
	health = max_health_value

func decrease_health(amount: float) -> void:
	health -= amount
	if health_bar:
		health_bar.value = health
	
	if health <= 0:
		emit_signal("death")

func heal_health(amount: float) -> void:
	health += amount
	
	if health > max_health_value:
		health = max_health_value
	
	if health_bar:
		health_bar.value += amount
