extends Node

var game_is_running: bool = false
var time_in_game: float = 0
var high_score: float = 0

func _ready():
	pass

func _process(delta):
	if game_is_running:
		time_in_game += delta
	pass
