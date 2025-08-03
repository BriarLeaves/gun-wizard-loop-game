extends Enemy

var speed: float = 300
var direction_vector: Vector2 = Vector2.ZERO
@onready var player = get_node("../Player")
@onready var bullet = preload("res://evil_bullet.tscn")
@export var bullet_speed: float = 200

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	screen_wrap()

func initialize(start_position):
	position = start_position


func _on_timer_timeout() -> void:
	$Sprite2D.modulate = Color.AQUAMARINE


func _on_shoot_timer_timeout() -> void:
	var bullet_direction = (player.position - position).normalized()
	var bullet_instance = bullet.instantiate()
	bullet_instance.velocity = bullet_direction * bullet_speed
	bullet_instance.position = position
	bullet_instance.times_wrapped = 1
	$"../BulletManager".add_child(bullet_instance)
