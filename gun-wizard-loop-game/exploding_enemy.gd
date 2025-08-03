extends Enemy

var speed: float = 300
var direction_vector: Vector2 = Vector2.ZERO
@onready var player = get_node("../Player")
@onready var bullet = preload("res://evil_bullet.tscn")
@export var bullet_speed: float = 200

var coordinates: Array[float] = [-1, 0, 1]

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	screen_wrap()

func initialize(start_position):
	position = start_position


func _on_timer_timeout() -> void:
	for x in coordinates:
		for y in coordinates:
			if x == 0 and y == 0:
				continue
			var bullet_direction = Vector2(x, y).normalized()
			var bullet_instance = bullet.instantiate()
			bullet_instance.velocity = bullet_direction * bullet_speed
			bullet_instance.position = position
			bullet_instance.times_wrapped = 1
			$"../BulletManager".add_child(bullet_instance)
	queue_free()
