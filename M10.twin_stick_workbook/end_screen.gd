class_name EndScreen extends Control

@onready var timer_label : Label = %Timer
var start_time := Time.get_ticks_msec()

func end_game() -> void:
	visible = true 
	get_tree().paused = true
	var end_time := Time.get_ticks_msec()
	var time_elapsed_msec := end_time - start_time
	var time_elapsed_sec := snappedf(time_elapsed_msec / 1000.0, 0.1) 
	#converts milliseconds to seconds 
	
	timer_label.text = "Time: " + str(time_elapsed_sec) + "s"
