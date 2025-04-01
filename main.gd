# A game_manager.gd script attached to a node in the main scene.
# This script handles the lifecycle of a game, including starting and stopping the game
extends Node2D
	
# Export a MiniGameManager variable so we can assign it in the inspector to the
# MiniGameManager node in our main scene.
@export var mini_game_manager: MiniGameManager

	

func _on_node_game_started(player_data_array: Array) -> void:
	var player = preload("res://player.tscn").instantiate()
	for player_data in player_data_array:
		add_child(player)
		print("Spawning player")
