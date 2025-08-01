extends Node

@onready var bullet = preload("res://bullet.tscn")
@onready var player = get_node("../Player")

var mouse_position: Vector2 = Vector2.ZERO

var bullet_direction: Vector2 = Vector2.ZERO
@export var bullet_speed: float = 3
@export var bullet_limit: int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(player)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_shoot_bullet() -> void:
	mouse_position = get_viewport().get_mouse_position()
	bullet_direction = (mouse_position - player.position).normalized()
	var bullet_instance = bullet.instantiate()
	bullet_instance.velocity = bullet_direction * bullet_speed
	bullet_instance.position = player.position
	$"../BulletManager".add_child(bullet_instance)
	
	if get_children().size() > bullet_limit:
		get_children()[0].queue_free()
