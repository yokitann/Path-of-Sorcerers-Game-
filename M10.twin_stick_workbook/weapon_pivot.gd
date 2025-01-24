extends Node2D

var direction_pointed := Vector2.ZERO

func _process(delta: float) -> void: 
	direction_pointed = global_position.direction_to(get_global_mouse_position())
	if direction_pointed.length() > 0.01:
		rotation = direction_pointed.angle()
