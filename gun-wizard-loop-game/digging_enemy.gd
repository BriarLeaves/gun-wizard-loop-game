extends Enemy

var speed: float = 300
var direction_vector: Vector2 = Vector2.ZERO
@onready var player = get_node("../Player")
@onready var bullet = preload("res://evil_bullet.tscn")
@onready var _animated_sprite = $AnimatedSprite2D
@export var bullet_speed: float = 200

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	screen_wrap()

func initialize(start_position):
	position = start_position
	$Area2D.set_collision_layer_value(3, false)


func _on_timer_timeout() -> void:
	_animated_sprite.play("idle")
	$Area2D.set_collision_layer_value(3, true)


func _on_shoot_timer_timeout() -> void:
	_animated_sprite.play("throw")


func _on_animated_sprite_2d_animation_finished() -> void:
	var bullet_direction = (player.position - position).normalized()
	var bullet_instance = bullet.instantiate()
	bullet_instance.velocity = bullet_direction * bullet_speed
	bullet_instance.position = position
	bullet_instance.times_wrapped = 1
	bullet_instance.look_at(player.position)
	$"../BulletManager".add_child(bullet_instance)
	_animated_sprite.play("idle")
