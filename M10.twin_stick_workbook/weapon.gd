extends Node2D

func shoot():
	print("spawned bullet") 

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()  
