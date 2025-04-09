extends Node

var max_lives=3
var lives = max_lives 
var hud
var id


func lose_life():
	lives-=1
	hud.load_hearts()
	if lives<0:
		print ("oh no")
	
	
	
