extends Node
var key = 0
var small_gears = 0
var medium_gears = 0
var big_gears = 0
var gear_selected = 0
var full_screen = true

var level = 0
var time = 10

func _input(event):
	if event.is_action_pressed("f11"):
		if full_screen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			full_screen = false
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			full_screen = true
