extends Node

var game_is_running: bool = false
var time_in_game: float = 0
var high_score: float = 0

func _ready():
	pass

func _process(delta):
	if game_is_running:
		time_in_game += delta
	if Input.is_action_just_pressed("toggle_fullscreen"):
		var window_mode = DisplayServer.window_get_mode()
		if window_mode != DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	pass
