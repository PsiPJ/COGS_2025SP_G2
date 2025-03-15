extends Node2D

func specific_spawn_decider(new_mob, array, direction):
	new_mob.global_position = array[0]
	direction = Vector2.RIGHT
	new_mob.velocity = direction * 300

func spawn_side_decider(new_mob):
	# the different spawn points are stored in an array corresponding to their location
	# for organizational purposes. A random number decides where they spawn.
	var SpawnPointsTop = [$"%SpawnPointTop1".global_position, $"%SpawnPointTop2".global_position]
	var SpawnPointsRight = [$"%SpawnPointRight1".global_position, $"%SpawnPointRight2".global_position]
	var SpawnPointsDown = [$"%SpawnPointDown1".global_position, $"%SpawnPointDown2".global_position]
	var SpawnPointsLeft = [$"%SpawnPointLeft1".global_position, $"%SpawnPointLeft2".global_position]
	
	var rng = RandomNumberGenerator.new()
	var random_number = rng.randi_range(1, 4)
	
	if(random_number == 1):
		print(SpawnPointsTop.size);
		specific_spawn_decider(new_mob, SpawnPointsTop, Vector2.DOWN)
	
	if(random_number == 2):
		print(SpawnPointsTop.size);
		specific_spawn_decider(new_mob, SpawnPointsRight, Vector2.LEFT)
		
	if(random_number == 3):
		var new: int = SpawnPointsTop.size()
		print(new)
		specific_spawn_decider(new_mob, SpawnPointsDown, Vector2.UP)

	if(random_number == 4):
		var new: int = SpawnPointsTop.size()
		print(new)
		specific_spawn_decider(new_mob, SpawnPointsLeft, Vector2.RIGHT)
		

func spawn_mob():
	#preload mob scene
	var new_mob = preload("res://mob.tscn").instantiate()
	
	#decides the properties of the mob before spawning it
	spawn_side_decider(new_mob)
	add_child(new_mob)

func _on_timer_timeout() -> void:
	#spawns a mob on a timer interval
	spawn_mob()
