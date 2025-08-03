extends Label

func _process(delta):
	text = "TIME: " + ("%10.3f" % GameManager.time_in_game)
