extends Node2D

#@export var bullet_scene : PackedScene = preload("res://bullet.tscn")

@export_range (0.0, 360.0, 1.0, "radians_as_degree") var random_range := PI / 12.0
@export_range (200.0, 1000.0, 1.0) var maximum_range := 25000.0 
@export_range (200.0, 2500.0, 1.0) var bullet_speed := 2000.0

#func shoot():
	#var bullet: Node = bullet_scene.instantiate()
	#get_tree().current_scene.add_child(bullet)
	#bullet.global_position = global_position
	#bullet.global_rotation = global_rotation
	#bullet.max_range = maximum_range
	#bullet.speed = bullet_speed
	#bullet.rotation += randf_range(-random_range / 2.0, random_range / 2.0)
	#print("spawned bullet") 

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()  
		
func shoot() -> void:
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.top_level = true
	new_bullet.global_position = $shootleft.global_position
	new_bullet.global_rotation = $shootleft.global_rotation
	$shootleft.add_child(new_bullet)
	
func shoot2() -> void: 
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.top_level = true
	new_bullet.global_position = $shootright.global_position
	new_bullet.global_rotation = $shootright.global_rotation
	$shootright.add_child(new_bullet)
	
