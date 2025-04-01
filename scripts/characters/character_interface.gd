extends CharacterBody2D
class_name CharacterInterface
#Sinal de morte do personagem
signal death

#Parametros padrões para os personagens, usando export para serem editados no editor
@export var speed: float = 0.0
@export var hSpd: float = 0.0
@export var vSpd: float = 0.0
@export var gravity: float = 0.0
var state: String = "idle"

#Verificações padrões para os personagens
var OnGround: bool = true
var isAttacking: bool = false
var isDeath: bool = false
