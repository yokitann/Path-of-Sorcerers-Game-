@tool
extends Area2D

@export var item: Item = null: set = set_item
@onready var _gem: Sprite2D = %Gem
@onready var _pickup_sound: AudioStreamPlayer2D = %PickupSound
@onready var _animation: AnimationPlayer = %AnimationPlayer

func _ready() -> void:
	set_item(item)
	_animation.play("idle")
	body_entered.connect(func (body: Node2D) -> void:
		if body is Player:
			item.use(body)
			_pickup_sound.play()
			_animation._animation.stop().connect(func (_animation_name: String) -> void:
				queue_free()
			)
		)

func set_item(value: Item) -> void:
	item = value
	if _gem != null:
		_gem.texture = item.texture
	if _pickup_sound != null:
		_pickup_sound.stream = item.sound_on_pickup
 
