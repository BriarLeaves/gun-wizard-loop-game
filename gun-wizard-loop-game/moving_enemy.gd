extends Enemy

var speed: float = 300

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	screen_wrap()

func initialize(start_position):
	position = start_position
	var random_direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()
	
	velocity = random_direction * speed
