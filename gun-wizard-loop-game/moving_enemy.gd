extends Enemy

var starting_velocity: float = 400

func _ready():
	velocity = Vector2(starting_velocity, 0)

func _physics_process(delta):
	position += velocity * delta
	screen_wrap()
