extends CharacterBody2D


func _physics_process(delta):
	var direction = Vector2.RIGHT
	velocity = direction * 300
	move_and_slide()

func _on_checker_body_entered(body: Node2D):
	if body.is_in_group("player"):
		body.ouch()
	#elif body.get_collision_layer() ==32:
		#body.queue_free()
		#queue_free()  # you can make it so if the player kills eemy, this is where the dead enemy animation would be implemented
