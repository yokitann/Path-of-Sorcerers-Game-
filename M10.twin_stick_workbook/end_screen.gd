extends Control

var start_time := Time.get_ticks_msec()

func end_game() -> void:
	var end_time := Time.get_ticks_msec()
	var time_elapsed_milliseconds := end_time - start_time
