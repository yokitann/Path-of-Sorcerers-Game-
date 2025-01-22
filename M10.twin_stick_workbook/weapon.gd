extends Node2D

@export var bullet_scene : PackedScene = preload("res://bullet.tscn")
@export_range (0.0, 360.0, 1, "radians_as_degree") var random_range := PI / 10.0
@export_range (100.0, 1000.0, 1.0) var maximum_range := 1200.0 
@export_range (200.0, 2000.0, 1.0) var bullet_speed := 1500.0

func shoot():
	var bullet: Node = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	bullet.max_range = maximum_range
	bullet.speed = bullet_speed
	bullet.rotation += randf_range(-random_range / 5.0, random_range / 5.0)
	print("spawned bullet") 

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()  
