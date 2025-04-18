extends Node2D
var shown = false
func _input(event):
	if event.is_action_pressed("esc"):
		pause()
	

func pause():
	if shown == false:
		if get_node("../Camera2D").enabled:
			scale.x = 1 / get_node("../Camera2D").zoom.x
			scale.y = 1 / get_node("../Camera2D").zoom.y
			position = get_node("../Camera2D").position
			get_tree().paused = true
			show()
			shown = true
	else:
		_on_resume_pressed()
		
func _on_resume_pressed():
	hide()
	get_tree().paused = false
	shown = false


func _on_walktrough_pressed():
	if Global.level == 0:
		OS.shell_open("https://www.youtube.com/watch?v=TLDhJd1Cg5Y")
	elif Global.level == 1:
		OS.shell_open("https://www.youtube.com/watch?v=TLDhJd1Cg5Y&t=56")
	elif Global.level == 2:
		OS.shell_open("https://www.youtube.com/watch?v=TLDhJd1Cg5Y&t=120")
	elif Global.level == 3:
		OS.shell_open("https://www.youtube.com/watch?v=TLDhJd1Cg5Y&t=214")
	elif Global.level == 4:
		OS.shell_open("https://www.youtube.com/watch?v=TLDhJd1Cg5Y&t=300")
	elif Global.level == 5:
		OS.shell_open("https://www.youtube.com/watch?v=TLDhJd1Cg5Y&t=600")


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
