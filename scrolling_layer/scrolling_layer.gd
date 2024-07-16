extends ParallaxLayer


@onready var sprite_2d = $Sprite2D

@export var texture: Texture
@export var scroll_scale: float = 0.0
@export var tx_x: float = 1920.0
@export var tx_y: float = 1080.0


# Called when the node enters the scene tree for the first time.
func _ready():
	motion_scale.x = scroll_scale
	
	var scale_f= get_viewport_rect().size.y / tx_y
	
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	motion_mirroring.x = tx_x * scale_f
