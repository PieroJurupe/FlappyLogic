extends Node

signal on_game_over
signal on_score_updated

const GROUP_PLANE: String = "plane"


var game_scene: PackedScene = preload("res://game/game.tscn")
var main_scene: PackedScene = preload("res://main/main.tscn")

var _score: int = 0
var _high_score: int = 0

func get_score() -> int:
	return _score

func get_high_score() -> int:
	return _high_score

func set_score(v: int) -> void:
	_score = v
	if _score > _high_score:
		_high_score = _score
	on_score_updated.emit()


func increment_score() -> void:
	set_score(_score+1)



func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)


func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scene)
