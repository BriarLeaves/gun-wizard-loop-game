extends Enemy
class_name DiggingEnemy

var speed: float = 300
var direction_vector: Vector2 = Vector2.ZERO
@onready var player = get_node("../Player")
var collision
var area2d

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	screen_wrap()

func initialize(start_position):
	position = start_position


func _on_timer_timeout() -> void:
	$Sprite2D.modulate = Color.AQUAMARINE
