extends CharacterBody2D

var x_axis: float = 0
var y_axis: float = 0
var move_vector: Vector2 = Vector2(0, 0)

func _ready():
	pass
	
func _process(delta):
	x_axis = 0
	y_axis = 0
	if Input.is_action_pressed("move_right"):
		x_axis += 1
	if Input.is_action_pressed("move_left"):
		x_axis -= 1
	if Input.is_action_pressed("move_up"):
		y_axis -= 1
	if Input.is_action_pressed("move_down"):
		y_axis += 1
	pass

func _physics_process(delta):
	move_and_slide()
	move_vector = Vector2(x_axis, y_axis).normalized()
	velocity = move_vector * 400
	pass
