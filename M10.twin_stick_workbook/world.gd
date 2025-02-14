extends Node2D

@onready var _teleporter: Area2D = %Teleport
@onready var _end_screen: Control = %EndScreen

func ready() -> void: 
	_teleporter.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			_end_screen.end_game()
	)
