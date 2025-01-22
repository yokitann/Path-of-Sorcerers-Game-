extends Sprite2D

const sprite_right := preload("res://player/godot_right.png")
const sprite_bottom_right := preload("res://player/godot_bottom_right.png") 
const sprite_bottom := preload("res://player/godot_bottom.png")
const sprite_up := preload("res://player/godot_up.png")
const sprite_up_right := preload("res://player/godot_up_right.png")

const up_right = Vector2.UP + Vector2.RIGHT
const up_left = Vector2.UP + Vector2.LEFT 
const down_right = Vector2.DOWN + Vector2.RIGHT 
const down_left = Vector2.DOWN + Vector2.LEFT 

func _process(delta: float) -> void:
	var move_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	var direction_movement := move_direction.sign()
	
	match direction_movement:
		Vector2.RIGHT, Vector2.LEFT: 
			texture = sprite_right 
		Vector2.UP:
			texture = sprite_up 
		Vector2.DOWN:
			texture = sprite_bottom
		up_right, up_left: 
			texture = sprite_up_right
		down_right, down_left:
			texture = sprite_bottom_right
	if direction_movement.length() > 0.0:
		flip_h = direction_movement.x < 0.0
