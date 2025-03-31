extends ParallaxBackground

@export var speed_background: float = 250.0  # Velocidade do fundo (camada mais lenta)
@export var speed_foreground: float = 350.0  # Velocidade da frente (camada mais rápida)

# Referências para as camadas
var bg_layer: ParallaxLayer
var fg_layer: ParallaxLayer


var bg_sprite: Sprite2D
var bg2_sprite: Sprite2D
var fg_sprite: Sprite2D
var fg2_sprite: Sprite2D

func _ready():
	# Pegando as camadas do ParallaxBackground
	bg_layer = get_child(0)  # ParallaxLayer do fundo
	bg_sprite = bg_layer.get_child(0)
	bg2_sprite = bg_layer.get_child(1)
	fg_layer = get_child(1)  # ParallaxLayer da frente
	fg_sprite = fg_layer.get_child(0)
	fg2_sprite = fg_layer.get_child(1)

func _process(delta):
	bg_layer.motion_offset.x -= speed_background * delta
	fg_layer.motion_offset.x -= speed_foreground * delta
	
	var bg_width = bg_sprite.texture.get_width()
	var fg_width = fg_sprite.texture.get_width()
	
	if bg_layer.motion_offset.x <= -bg_width :
		bg_layer.motion_offset.x += bg_width
	
	if fg_layer.motion_offset.x <= -fg_width:
		fg_layer.motion_offset.x += fg_width
