extends Node2D

@onready var score_sound = $ScoreSound

const  SCROLL_SPEED: float = 200.0 


func _ready():
	pass


func _process(delta):
	position.x -= SCROLL_SPEED  * delta


func player_scored() -> void:
	score_sound.play()
	GameManager.increment_score()


func on_screen_exited():
	queue_free()


func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLANE) == true:
		body.die()


func _on_laser_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLANE) == true:
		player_scored()
