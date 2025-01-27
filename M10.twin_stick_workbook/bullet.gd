extends Area2D

@export var speed := 900.0
@export var max_range := 800.0
@export var distance_traveled := 0.0

func _physics_process(delta: float) -> void:
	var movement := speed * delta
	var direction := Vector2.RIGHT.rotated(rotation) * movement
	position += direction
	
	distance_traveled += movement 
	if distance_traveled > max_range: 
		_destroy()

func _destroy(): 
	queue_free()
