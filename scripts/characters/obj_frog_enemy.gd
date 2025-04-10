extends Enemy
class_name Frog

@export var gravity:float = 25
@export var jump_force:float = 500

@export var wait_time_min:float = 0.5
@export var wait_time_max:float = 3

var vSpd:float = 50.0
var on_ground:bool = true

@onready var anim: AnimatedSprite2D = $anim

@onready var timer: Timer = $Timer

func _ready() -> void:
	super._ready()
	timer.start(randi_range(wait_time_min, wait_time_max))

func _physics_process(delta: float) -> void:
	if is_on_floor() and !_death:
		if velocity.y >= 0:
			velocity.y = 0.0
			if not anim.animation == "default":
				call_deferred("swap_states")
	else:
		velocity.y += delta * gravity * gravity
	
	move_and_slide()


func jump() -> void :
	if is_on_floor():
		$AudioStreamPlayer.play_audio("jump")
		velocity.y = -jump_force
		call_deferred("swap_states")

func swap_states() -> void:
	$collision_jump.disabled = !$collision_jump.disabled
	$collision.disabled = !$collision.disabled 
	anim.play( "jump" if anim.animation == "default" else "default")
