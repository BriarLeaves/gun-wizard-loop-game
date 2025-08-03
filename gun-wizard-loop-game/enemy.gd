extends CharacterBody2D
class_name Enemy

@onready var screen_size: Vector2 = get_viewport_rect().size
var health: int = 3

func take_damage(amt): 
	health -= amt
	if health <= 0:
		enemy_death()
	pass
	
func enemy_death():
	queue_free()
	pass

func screen_wrap():
	position.x = wrapf(position.x, -90, screen_size.x + 90)
	position.y = wrapf(position.y, -90, screen_size.y + 90)

func _on_area_2d_area_entered(area: Area2D) -> void:
	for obj in $Area2D.get_overlapping_areas():
		obj.queue_free()
		queue_free()
