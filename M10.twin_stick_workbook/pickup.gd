@tool
extends Area2D

@export var item: Item = null: set = set_item
@onready var _gem: Sprite2D = %Gem
@onready var _pickup_sound: AudioStreamPlayer2D = %PickupSound

func _ready() -> void:
	set_item(item)
	body_entered.connect(func (body: Node2D) -> void:
		if body is Player:
			item.use(body)
		)

func set_item(value: Item) -> void:
	item = value
	if _gem != null:
		_gem.texture = item.texture
	if _pickup_sound != null:
		_pickup_sound.stream = item.sound_on_pickup
 
