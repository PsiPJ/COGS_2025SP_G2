extends CanvasLayer

func _ready(): 
	load_hearts()
	Global.hud = self
	
	
func load_hearts():
	$FullHeart.size.x = Global.lives*16
	
	$EmptyHeart.size.x = (Global.max_lives - Global.lives) * 16
	$EmptyHeart.position.x = $FullHeart.position.x + $FullHeart.size.x * $FullHeart.scale.x
