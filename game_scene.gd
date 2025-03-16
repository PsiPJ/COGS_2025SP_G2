extends Node2D

func specific_spawn_decider(new_mob, array, index, direction):
	# sets the properties of the mob
	new_mob.global_position = array[index]
	new_mob.velocity = direction * 300

func spawn_side_decider(new_mob):
	# the different spawn points are stored in an array corresponding to their location
	
	# we should be able to freely add and delete spawn points to these arrays without having to
	# change much code. Simply add a new ColorRect (or other node) as a child of SpawnPoints,
	# access as a unique name, and add it to the corresponding array.
	
	var SpawnPointsTop = [$"SpawnPoints/Top1".global_position, $"SpawnPoints/Top2".global_position, $"SpawnPoints/Top3".global_position]
	var SpawnPointsRight = [$"SpawnPoints/Right1".global_position, $"SpawnPoints/Right2".global_position]
	var SpawnPointsBottom = [$"SpawnPoints/Bottom1".global_position, $"SpawnPoints/Bottom2".global_position, $"SpawnPoints/Bottom3".global_position]
	var SpawnPointsLeft = [$"SpawnPoints/Left1".global_position, $"SpawnPoints/Left2".global_position]
	
	var rng = RandomNumberGenerator.new()
	var random_number = rng.randi_range(1, 4)
	
	if(random_number == 1):
		random_number = rng.randi_range(0, SpawnPointsTop.size() - 1)
		specific_spawn_decider(new_mob, SpawnPointsTop, random_number, Vector2.DOWN)
	elif(random_number == 2):
		random_number = rng.randi_range(0, SpawnPointsRight.size() - 1)
		specific_spawn_decider(new_mob, SpawnPointsRight, random_number, Vector2.LEFT)
	elif(random_number == 3):
		random_number = rng.randi_range(0, SpawnPointsBottom.size() - 1)
		specific_spawn_decider(new_mob, SpawnPointsBottom, random_number, Vector2.UP)
	elif(random_number == 4):
		random_number = rng.randi_range(0, SpawnPointsLeft.size() - 1)
		specific_spawn_decider(new_mob, SpawnPointsLeft, random_number, Vector2.RIGHT)
		
	
func spawn_mob():
	#preload mob scene
	var new_mob = preload("res://mob.tscn").instantiate()
	
	#decides the properties of the mob before spawning it
	spawn_side_decider(new_mob)
	add_child(new_mob)

func _on_timer_timeout() -> void:
	#spawns a mob on a timer interval
	spawn_mob()
