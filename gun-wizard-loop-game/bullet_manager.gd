extends Node

@onready var bullet = preload("res://bullet.tscn")
@onready var player_arm = get_node("../Player/Arm")
@onready var shooting_point = get_node("../Player/Arm/ShootingPoint")

var mouse_position: Vector2 = Vector2.ZERO

var bullet_direction: Vector2 = Vector2.ZERO
@export var bullet_speed: float = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	mouse_position = get_viewport().get_mouse_position()
	player_arm.look_at(mouse_position)
	if player_arm.global_position.x < mouse_position.x:
		player_arm.flip_v = false
	else:
		player_arm.flip_v = true

func _on_player_shoot_bullet() -> void:
	bullet_direction = (mouse_position - shooting_point.global_position).normalized()
	var bullet_instance = bullet.instantiate()
	bullet_instance.velocity = bullet_direction * bullet_speed
	bullet_instance.position = shooting_point.global_position
	bullet_instance.look_at(mouse_position)
	$"../BulletManager".add_child(bullet_instance)
