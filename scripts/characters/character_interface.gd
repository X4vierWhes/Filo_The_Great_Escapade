extends CharacterBody2D
class_name CharacterInterface
#Sinal de morte do personagem
signal death
#Estados em que um personagem pode se encontrar
enum states {RUNNING, JUMP}

#Parametros padrões para os personagens, usando export para serem editados no editor
@export var speed: float = 0.0
@export var hSpd: float = 0.0
@export var vSpd: float = 0.0
@export var gravity: float = 0.0

#Verificações padrões para os personagens
var OnGround: bool = true
var isAttacking: bool = false
var isDeath: bool = false
