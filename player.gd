extends CharacterBody2D

@export var player_id = 1 # Used to tell which player this is (for multiplayer)

var health = 3 # Starting health

var ded_texture = preload("res://Ded.png")

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
	
	velocity = direction * 30000 * delta # Multiplies direction by speed and delta time
	move_and_slide() # Built-in Godot movement function

# this function will execute everytime an enemy enters the players hitbox
# upon getting hit, the player will take damage, and if health goes to 0 we queue free
func _on_hurt_box_area_entered(area: Area2D) -> void:
	if health > 0:
		var heart_node = $HealthBar.get_node("Heart%d" % health)
		heart_node.texture = ded_texture
		health -= 1
		if health == 0:
			queue_free()
