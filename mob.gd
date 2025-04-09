extends CharacterBody2D



func _physics_process(delta):
	# NOTE: the direction and velocity is set in the game scene script
	move_and_slide()
	


func _on_checker_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") :
		body.ouch(Global.id)
	 # you can make it so if the player kills eemy, this is where the dead enemy animation would be implemented

# despawns mobs after they leave the screen (adjust wait time property of timer node to change)
func _on_timer_timeout() -> void:
	queue_free()
