extends Area2D
class_name Bullet

var velocity: Vector2 = Vector2.ZERO
var times_wrapped: int = 0 #number of times this bullet has screen wrapped (if it has, then it may damage the player)

@onready var screen_size: Vector2 = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position += velocity * delta
	if position.x < 0 || position.x > screen_size.x || position.y > screen_size.y || position.y < 0:
		times_wrapped += 1
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
