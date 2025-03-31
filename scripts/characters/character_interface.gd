extends CharacterBody2D
class_name CharacterInterface

signal death

#Parametros padrões para os personegens
@export var speed: float = 0.0
@export var hSpd: float = 0.0
@export var vSpd: float = 0.0
@export var gravity: float = 0.0

#Verificações padrões para os personagens
var OnGround: bool = false
var isAttacking: bool = false


func jump() -> void:
	pass
