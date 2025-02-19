extends CharacterBody2D

#controls for player and speed
func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 60000 * delta #delta might be unecessary
	move_and_slide()
