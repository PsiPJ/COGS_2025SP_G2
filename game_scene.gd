extends Node2D

# Originally, the wait time will be assigned according to when the players
# spawn in through the inspector window. Then, it will be set to a consistant
# number through the ready function
func _ready():
	$Timer.wait_time = 2

func specific_spawn_decider(new_mob, array, index, direction):
	# sets the properties of the mob
	new_mob.global_position = array[index]
	new_mob.velocity = direction * (300 + time_elapsed)

func spawn_side_decider(new_mob):
	# the different spawn points are stored in an array corresponding to their location
	
	# we should be able to freely add and delete spawn points to these arrays without having to
	# change much code. Simply add a new ColorRect (or other node) as a child of SpawnPoints,
	# access as a unique name, and add it to the corresponding array.
	
	var SpawnPointsTop = [$"SpawnPoints/Top1".global_position, $"SpawnPoints/Top2".global_position, $"SpawnPoints/Top3".global_position, $"SpawnPoints/Top4".global_position, $"SpawnPoints/Top5".global_position, $"SpawnPoints/Top6".global_position]
	var SpawnPointsRight = [$"SpawnPoints/Right1".global_position, $"SpawnPoints/Right2".global_position, $"SpawnPoints/Right3".global_position, $"SpawnPoints/Right4".global_position, $"SpawnPoints/Right5".global_position]
	var SpawnPointsBottom = [$"SpawnPoints/Bottom1".global_position, $"SpawnPoints/Bottom2".global_position, $"SpawnPoints/Bottom3".global_position, $"SpawnPoints/Bottom4".global_position, $"SpawnPoints/Bottom5".global_position, $"SpawnPoints/Bottom6".global_position]
	var SpawnPointsLeft = [$"SpawnPoints/Left1".global_position, $"SpawnPoints/Left2".global_position, $"SpawnPoints/Left3".global_position, $"SpawnPoints/Left4".global_position, $"SpawnPoints/Left5".global_position]
	
	var rng = RandomNumberGenerator.new()
	var random_number = rng.randi_range(1, 3)
	
	if(random_number == 1):
		random_number = rng.randi_range(0, SpawnPointsTop.size() - 1)
		specific_spawn_decider(new_mob, SpawnPointsTop, random_number, Vector2.DOWN)
	elif(random_number == 2):
		random_number = rng.randi_range(0, SpawnPointsRight.size() - 1)
		specific_spawn_decider(new_mob, SpawnPointsRight, random_number, Vector2.LEFT)
	elif(random_number == 4):
		random_number = rng.randi_range(0, SpawnPointsBottom.size() - 1)
		specific_spawn_decider(new_mob, SpawnPointsBottom, random_number, Vector2.UP)
	elif(random_number == 3):
		random_number = rng.randi_range(0, SpawnPointsLeft.size() - 1)
		specific_spawn_decider(new_mob, SpawnPointsLeft, random_number, Vector2.RIGHT)
		
	
func spawn_mob():
	#preload mob scene
	var new_mob = preload("res://mob.tscn").instantiate()
#<<<<<<< HEAD
#	new_mob.global_position = $"SpawnPoint".global_position

	
	#decides the properties of the mob before spawning it
	spawn_side_decider(new_mob)
#>>>>>>> 7bb26dd325d3d65478a8bd7191a940b1331e8df9
	add_child(new_mob)


var time_elapsed = 1
func _process(delta: float):
	time_elapsed += delta

func _on_timer_timeout() -> void:
	#spawns a mob on a timer interval
	spawn_mob()
	if(time_elapsed > 10):
		spawn_mob()
	if(time_elapsed > 20):
		spawn_mob()
	
