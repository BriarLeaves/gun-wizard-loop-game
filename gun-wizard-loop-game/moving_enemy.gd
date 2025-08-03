extends Enemy

var starting_velocity: float = 400
var speed: float = 400

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	screen_wrap()

func initialize():
	var random_direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()
	look_at(random_direction)
	
	velocity = random_direction * speed


func _on_area_2d_area_entered(area: Area2D) -> void:
	for obj in $Area2D.get_overlapping_areas():
		obj.queue_free()
		queue_free()
