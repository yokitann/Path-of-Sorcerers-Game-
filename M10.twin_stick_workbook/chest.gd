@tool
extends Area2D

@export var possible_items: Array[Item] = []
@onready var _animation: AnimationPlayer = %AnimationPlayer

var _player_touch := false 
var _first_open := true

func _ready() -> void: 
	body_entered.connect(func (body: Node) -> void:
		_player_touch = true 
	)
	body_exited.connect(func (body: Node) -> void: 
		_player_touch = false 
	)

func _unhandled_input(event: InputEvent) -> void:
	if _player_touch and Input.is_action_just_pressed("pick_up") and _first_open:
		open()
		get_viewport().set_input_as_handled()

func open() -> void:
	_animation.play("open")
	_first_open = false 
	_pickup_spawn()
	#not open again because first_open will not be true, so the _unhandled function will not play

func _pickup_spawn():
	var item: Item = possible_items.pick_random() 
	var pickup: Pickup = preload("res://pickup.tscn").instantiate()
	pickup.item = item
	add_child(pickup)
	
	var random_angle := randf_range(0.0, 3.0 * PI)
	var random_distance := randf_range(2.0, 0.0)
	var random_position := Vector2(0.0,7.0).rotated(random_angle) 
	
	#var random_angle := randf_range(0.0, 2.0 * PI)
	#var random_direction := Vector2(1.0, 0.0).rotated(random_angle)
	#var land_position := random_direction * randf_range(60.0, 120.0)
