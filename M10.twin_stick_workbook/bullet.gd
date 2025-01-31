class_name Bullet extends Area2D

@export var speed := 900.0
@export var max_range := 800.0
@export var distance_traveled := 0.0
@export var damage := 30
var _mob: Mob

func _physics_process(delta: float) -> void:
	var movement := speed * delta
	var direction := Vector2.RIGHT.rotated(rotation) * movement
	position += direction
	
	distance_traveled += movement 
	if distance_traveled > max_range: 
		_destroy()

func _ready() -> void:
	body_entered.connect(func (body: Node) -> void:
		if body is Mob:
			body.health -= damage
	)

func _destroy(): 
	queue_free()
