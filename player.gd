extends CharacterBody2D

@export var player_id = 1 # Used to tell which player this is (for multiplayer)
@export var health = 3 # health is also used for scoring
@export var color: Color

var invincibility_time = 1.0
var is_invincible = false

signal took_damage(player_id: int, amount: int)

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
	if is_invincible:
		return
	if health > 0:
		invincibility_frames()
		emit_signal("took_damage", player_id, 1)
		var heart_node = $HealthBar.get_node("Heart%d" % health)
		heart_node.texture = ded_texture
		health -= 1
		if health == 0:
			queue_free()
			
#function that will make the player invisible for a short period of time
func invincibility_frames():
	is_invincible = true
	var color_copy = $Sprite2D.modulate
	color_copy.a = 0.5
	$Sprite2D.modulate = color_copy
	await get_tree().create_timer(invincibility_time).timeout 
	is_invincible = false
	$Sprite2D.modulate = color
