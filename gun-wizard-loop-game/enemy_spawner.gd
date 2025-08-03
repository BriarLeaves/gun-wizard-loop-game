extends Node2D

@export var enemies: Array[PackedScene]
var current_enemies: Array[PackedScene]

@onready var screen_size: Vector2 = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_enemies.append(enemies[0])
	#current_enemies.append(enemies[1])
	current_enemies.append(enemies[2])

# Called every frame. 'delta' is the elapsed time since the prwevious frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var enemyType = randi_range(0, current_enemies.size() - 1)
	var enemy = current_enemies[enemyType].instantiate()
	
	if get_node("Player"):
		$Timer.stop()
		pass
	
	#if enemy == current_enemies[0] || enemy == current_enemies[1]:
	if enemyType == 0:
		var enemy_spawn_location = get_node("SpawnPath/SpawnLocation")
		enemy_spawn_location.progress_ratio = randf()
	
		enemy.initialize(enemy_spawn_location.position)
	else:
		var enemy_spawn_location = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
		while enemy_spawn_location.distance_to(get_node("Player").position) < 20:
			enemy_spawn_location = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
		enemy.initialize(enemy_spawn_location)
	add_child(enemy)
