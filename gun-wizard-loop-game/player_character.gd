extends CharacterBody2D

var x_axis: float = 0
var y_axis: float = 0
var move_vector: Vector2 = Vector2.ZERO
var mouse_position: Vector2 = Vector2.ZERO
var player_speed: float = 1

var bullet_direction: Vector2 = Vector2.ZERO
var bullet_speed: float = 3

@onready var bullet = preload("res://bullet.tscn")

func _ready():
	pass
	
func _process(delta):
	x_axis = 0
	y_axis = 0
	if Input.is_action_pressed("move_right"):
		x_axis += player_speed
	if Input.is_action_pressed("move_left"):
		x_axis -= player_speed
	if Input.is_action_pressed("move_up"):
		y_axis -= player_speed
	if Input.is_action_pressed("move_down"):
		y_axis += player_speed
		
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
	velocity = move_vector * 400
	pass
