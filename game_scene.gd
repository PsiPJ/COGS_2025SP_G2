extends Node2D

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	new_mob.global_position = $"SpawnPoint".global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()
