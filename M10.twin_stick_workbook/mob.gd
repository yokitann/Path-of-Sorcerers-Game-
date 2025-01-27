extends CharacterBody2D

@export var max_speed := 500.0
@export var acceleration := 600.0

var _player: Player = null

@onready var _HitBox: Area2D = %HitBox

func _ready() -> void:
	_HitBox.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			_player = body
	)
	_HitBox.body_exited.connect(func (body: Node) -> void:
		if body is Player:
			_player = null
	)


func _physics_process(delta: float) -> void:
	if _player == null:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
	else:
		var direction := global_position.direction_to(_player.global_position)
		var distance := global_position.distance_to(_player.global_position)
		var speed := max_speed if distance > 100.0 else max_speed * distance / 100.0
		var desired_velocity := direction * speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)

	move_and_slide()
