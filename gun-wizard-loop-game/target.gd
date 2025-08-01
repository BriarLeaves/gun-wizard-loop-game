extends StaticBody2D

@export var current_room: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for obj in $Area2D.get_overlapping_areas():
		obj.queue_free()
		queue_free()
