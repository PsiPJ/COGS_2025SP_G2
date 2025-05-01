extends CharacterBody2D

@onready var _animated_spirte = $Sprite2D/AnimatedSprite2D

func _ready() -> void:
	_animated_spirte.play("default")
