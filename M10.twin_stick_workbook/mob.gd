class_name Mob extends CharacterBody2D

@onready var _HitBox: Area2D = %HitBox
@onready var _DamageArea: Area2D = %DamageArea
@export var max_speed := 600.0
@export var acceleration := 200.0
@export var health := 100: set = setter_health
@export var damage := 20
var _player: Player = null

func _physics_process(delta: float) -> void:
	if _player == null:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
	else:
		var direction := global_position.direction_to(_player.global_position)
		var distance := global_position.distance_to(_player.global_position)
		var speed := max_speed if distance > 50.0 else max_speed * distance / 50.0
		var desired_velocity := direction * speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
	move_and_slide()

func _ready() -> void:
	_HitBox.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			_player = body
	)
	_HitBox.body_exited.connect(func (body: Node) -> void:
		if body is Player:
			_player = null
	)
	_DamageArea.body_entered.connect(func (body: Node) -> void:
		if body is Player: 
			body.health -= damage
	)

func setter_health(new_health: int) -> void: 
	health = new_health 
	if health <= 0:
		die()

func die() -> void:
	queue_free()
