extends Node

@export var enemies: Array[PackedScene]
var current_enemies: Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_enemies.append(enemies[0])

# Called every frame. 'delta' is the elapsed time since the prwevious frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var enemy = current_enemies.pick_random().instantiate()
	
	var enemy_spawn_location = get_node("SpawnPath/SpawnLocation")
	enemy_spawn_location.progress_ratio = randf()
	print(enemy_spawn_location.progress_ratio)
	
	enemy.initialize()
	
	add_child(enemy)
