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
	if Input.is_action_just_pressed("pick_up") and _first_open:
		open()

func open() -> void:
	_animation.play("open")
	_first_open = false 
	#not open again because first_open will not be true, so the _unhandled function will not play
