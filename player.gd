extends CharacterBody2D


var health = 100.0

func _ready(): 
	add_to_group("player")
#controls for player and speed
func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 60000 * delta #delta might be unecessary
	move_and_slide()
	
	
	

	#const DAMAGE_RATE = 5.0
	#var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	#if overlapping_mobs.size() > 0:
	#	health -= DAMAGE_RATE * overlapping_mobs.size() * delta
	#	%ProgressBar.value = health
	
func ouch():
	Global.lose_life()
	
	set_modulate (Color(1, 0.3, 0.3, 0.3))
	$RedTimer.start()
	#a few moment after u get hit, this'll call another function 


func _on_red_timer_timeout() -> void:
	set_modulate (Color(1, 1, 1, 1)) # Replace with function body.
