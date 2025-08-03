extends Control


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://room.tscn")
	pass # Replace with function body.

func _on_quit_game_pressed():
	get_tree().quit()
	pass # Replace with function body.
