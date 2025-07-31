extends CharacterBody2D

var x_axis: float = 0 # variable represents the input on the x axis
var y_axis: float = 0 # variable represents the input on the y axis
var move_vector: Vector2 = Vector2.ZERO
var mouse_position: Vector2 = Vector2.ZERO
var player_speed: float = 400

var bullet_direction: Vector2 = Vector2.ZERO
var bullet_speed: float = 3

var lower_wrap_bound: float = 648
var right_wrap_bound: float = 1152

@onready var bullet = preload("res://bullet.tscn")

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
		
	if Input.is_action_just_pressed("shoot"):
		mouse_position = get_viewport().get_mouse_position()
		bullet_direction = (mouse_position - position).normalized()
		var bullet_instance = bullet.instantiate()
		bullet_instance.velocity = bullet_direction * bullet_speed
		bullet_instance.position = position
		$"../BulletManager".add_child(bullet_instance)
	pass

func _physics_process(delta):
	move_and_slide()
	move_vector = Vector2(x_axis, y_axis).normalized()
	velocity = move_vector * player_speed
	screen_wrap()
	
func screen_wrap():
	if position.y < 0:
		position.y = lower_wrap_bound
	elif position.y > lower_wrap_bound:
		position.y = 0
	if position.x < 0:
		position.x = right_wrap_bound
	elif position.x > right_wrap_bound:
		position.x = 0
