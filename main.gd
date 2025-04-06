# A game_manager.gd script attached to a node in the main scene.
# This script handles the lifecycle of a game, including starting and stopping the game
extends Node2D
	
# Export a MiniGameManager variable so we can assign it in the inspector to the
# MiniGameManager node in our main scene.
@export var mini_game_manager: MiniGameManager

var new_player_data

# when the game starts, for each player_data we will load our player scene,
# set its properties according to the save data, and spawn them in.
# We specifically set their player_id, color, and positions here
func _on_node_game_started(player_data_array: Array) -> void:
	new_player_data = player_data_array

# length of game is currently determined by this "time_left" variable. We can change
# this is the future to be something else, or base the game on something other than time
# such as wait for everyone to die.
var time_left = 10
func _process(delta: float):
	time_left -= delta
	if time_left < 0:
		# End the game after the time is up
		end_game()
		
func end_game():
	# Here, we can add some code that distributes points based on the amount of
	# health each player has left. For now, the points are just arbitrarily given
	# for test purposes
	
	mini_game_manager.end_game([
		{
			"player": 0,
			"points": 5
		},
		{
			"player": 1,
			"points": 5
		}
	])


func _on_timer_timeout() -> void:
	for player_data in new_player_data:
		var player = preload("res://player.tscn").instantiate()
		player.player_id = player_data.number
		player.global_position = Vector2(350 + (100 * player_data.number), 220)
		player.get_node("Sprite2D").modulate = Color(player_data.color)
		add_child(player)
