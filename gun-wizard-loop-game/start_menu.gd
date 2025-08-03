extends Control

func _ready():
	var defeat_message: Node = null
	defeat_message = get_node_or_null("MarginContainer/CenterContainer/VBoxContainer/DefeatMessage")
	if defeat_message != null:
		defeat_message.text = "The wizard has defeated you...\nIt took %s seconds." % (roundf(GameManager.time_in_game * 1000) / 1000)

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://room.tscn")
	pass # Replace with function body.

func _on_quit_game_pressed():
	get_tree().quit()
	pass # Replace with function body.

func _on_return_to_title_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")
	pass # Replace with function body.
