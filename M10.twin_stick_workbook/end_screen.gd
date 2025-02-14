class_name EndScreen extends Control

var start_time := Time.get_ticks_msec()
@onready var timer_label : Label = %Timer

@onready var play_again_button : Button = %PlayAgainButton
@onready var quit_button : Button = %QuitButton

func end_game() -> void:
	visible = true
	get_tree().paused = true
	var end_time := Time.get_ticks_msec()
	var time_elapsed_msec := end_time - start_time
	var time_elapsed_sec := snappedf(time_elapsed_msec / 1000.0, 0.1) 
	#converts milliseconds to seconds 
	timer_label.text = "Time: " + str(time_elapsed_sec) + "s"
	

func _ready() -> void:
	play_again_button.pressed.connect(func() -> void: 
		get_tree().paused = false
		get_tree().reload_current_scene()
		)
	quit_button.pressed.connect(get_tree().quit)
