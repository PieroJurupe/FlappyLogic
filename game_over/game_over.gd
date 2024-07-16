extends Control


@onready var game_over_label = $GameOverLabel
@onready var pressed_space_label = $PressedSpaceLabel
@onready var timer = $Timer

var _can_press_space: bool = false


func _ready():
	GameManager.on_game_over.connect(_on_game_over)



func _process(delta):
	if _can_press_space == true:
		if Input.is_action_just_pressed("fly") == true:
			GameManager.load_main_scene()


func _on_game_over() -> void:
	show()
	timer.start()


func run_secuence() -> void:
	game_over_label.hide()
	pressed_space_label.show()
	_can_press_space = true


func _on_timer_timeout():
	run_secuence()
