extends Node2D

@export var enemies: Array[PackedScene]
var current_enemies: Array[PackedScene]

@onready var screen_size: Vector2 = get_viewport_rect().size

var time_spawn_digging: float = 15.0
var time_spawn_exploding: float = 30.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_enemies.append(enemies[0])

# Called every frame. 'delta' is the elapsed time since the prwevious frame.
func _process(delta: float) -> void:
	GameManager.time_in_game += delta
	if GameManager.time_in_game >= time_spawn_digging:
		current_enemies.append(enemies[1])
	if GameManager.time_in_game >= time_spawn_exploding:
		current_enemies.append(enemies[2])

func _on_timer_timeout() -> void:
	var enemyType = randi_range(0, current_enemies.size() - 1)
	var enemy = current_enemies[enemyType].instantiate()
	
	if enemyType == 2:
		var enemy_spawn_location = get_node("SpawnPath/SpawnLocation")
		enemy_spawn_location.progress_ratio = randf()
	
		enemy.initialize(enemy_spawn_location.position)
	else:
		var enemy_spawn_location = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
		while enemy_spawn_location.distance_to(get_node("Player").position) < 75:
			enemy_spawn_location = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
		enemy.initialize(enemy_spawn_location)
	add_child(enemy)
