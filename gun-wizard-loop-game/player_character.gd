extends CharacterBody2D

var x_axis: float = 0 # variable represents the input on the x axis
var y_axis: float = 0 # variable represents the input on the y axis
var move_vector: Vector2 = Vector2.ZERO
var mouse_position: Vector2 = Vector2.ZERO
var player_speed: float = 400

@onready var screen_size: Vector2 = get_viewport_rect().size

signal shoot_bullet

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
		shoot_bullet.emit()
	pass

func _physics_process(delta):
	move_and_slide()
	move_vector = Vector2(x_axis, y_axis).normalized()
	velocity = move_vector * player_speed
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

func _on_area_2d_area_entered(area: Area2D) -> void:
	for obj in $Area2D.get_overlapping_areas():
		if obj is Bullet:
			if obj.times_wrapped >= 1:
				queue_free()
				obj.queue_free()
		elif obj is Enemy:
			queue_free()
