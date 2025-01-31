class_name Player extends CharacterBody2D

@export var speed := 460.0
@export var steering_factor := 10.0
@export var max_health := 100
@onready var _HealthBar: ProgressBar = %HealthBar
var health := max_health: set = setter_health

func _physics_process(delta: float) -> void:
	var move_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var desired_velocity := speed * move_direction
	var steering := desired_velocity - velocity
	velocity += steering * steering_factor * delta
	move_and_slide()

func _ready() -> void: 
	_HealthBar.max_value = max_health
	_HealthBar.value = health 

func setter_health(new_health: int) -> void: 
	var previous_health := health
	health = clampi(new_health, 0, max_health)
	if health <= 0:
		die()

func die() -> void: 
	queue_free()
