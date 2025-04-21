extends CharacterBody2D

@export var player_id = 1 # Used to tell which player this is (for multiplayer)

var health = 100.0 # Starting health

func _ready(): 
	add_to_group("player") # Add this node to the "player" group
	Global.id = self # Save reference to this player in a global variable

# Controls movement based on player input
func _physics_process(delta):
	var direction = Input.get_vector(
		"move_left_%s" % [player_id],
		"move_right_%s" % [player_id],
		"move_up_%s" % [player_id],
		"move_down_%s" % [player_id]
	)
	
	velocity = direction * 60000 * delta # Multiplies direction by speed and delta time
	move_and_slide() # Built-in Godot movement function

	# Health draining logic (commented out for now)
	# const DAMAGE_RATE = 5.0  
	# var overlapping_mobs = %HrtBox.get_overlapping_bodies()
	# if overlapping_mobs.size() > 0:
	#     health -= DAMAGE_RATE * overlapping_mobs.size() * delta # Lose more health the more mobs you're touching
	#     %ProgressBar.value = health # Update the health bar on screen

# This function is called when the player takes damage
func ouch(id):
	Global.lose_life() # Tell the global script to reduce lives
	set_modulate(Color(1, 0.3, 0.3, 0.3)) # Flash red to show damage taken
	$RedTimer.start() # Start a timer that will reset the color after a bit

# Called when RedTimer finishes
func _on_red_timer_timeout() -> void:
	set_modulate(Color(1, 1, 1, 1)) # Return to normal color
