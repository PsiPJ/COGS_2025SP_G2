extends CharacterBody2D

func _physics_process(delta):
	# NOTE: the direction and velocity is set in the game scene script
	move_and_slide()


# despawns mobs after they leave the screen (adjust wait time property of timer node to change)
func _on_timer_timeout() -> void:
	queue_free()
