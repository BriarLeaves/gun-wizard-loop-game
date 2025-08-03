extends Node

@onready var bullet = preload("res://bullet.tscn")
@onready var player = get_node("../Player")
@onready var shooting_point = get_node("../Player/Arm/ShootingPoint")

var mouse_position: Vector2 = Vector2.ZERO

var bullet_direction: Vector2 = Vector2.ZERO
@export var bullet_speed: float = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(shooting_point.global_position)
	pass


func _on_player_shoot_bullet() -> void:
	mouse_position = get_viewport().get_mouse_position()
	bullet_direction = (mouse_position - shooting_point.global_position).normalized()
	var bullet_instance = bullet.instantiate()
	bullet_instance.velocity = bullet_direction * bullet_speed
	bullet_instance.position = shooting_point.global_position
	$"../BulletManager".add_child(bullet_instance)
