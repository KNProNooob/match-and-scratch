extends Node2D
var config = ConfigFile.new()
func _ready():
	if OS.get_name() == "Web":
		$Quit.hide()
	if config.load_encrypted_pass("user://save.txt", "bWFqa2EgemFqa2E=") == OK:
		var file_level = config.get_value("data", "level")
		var time = config.get_value("data", "time")
		var completed = config.get_value("data", "completed")
		if file_level != null and file_level < 6 and file_level > 0:
			$continue.disabled = false
			Global.level = file_level
		if time != null and time > 0:
			Global.time = time
		if completed:
			$leaderboard.show()
func _on_quit_pressed():
	get_tree().quit()
	



func _on_new_game_pressed():
	if config.load_encrypted_pass("user://save.txt", "bWFqa2EgemFqa2E=") == OK:
		config.set_value("data", "level", null)
		config.set_value("data", "time", null)
		config.save_encrypted_pass("user://save.txt", "bWFqa2EgemFqa2E=")
	Global.time = 0
	get_tree().change_scene_to_file("res://level_0.tscn")
	
func _on_leaderboard_pressed():
	OS.shell_open("https://gamejolt.com/games/match-and-scratch/885910/scores/899364/best")


func _on_continue_pressed():
	get_tree().change_scene_to_file("res://level_" + str(Global.level) + ".tscn")


func _on_credits_pressed():
	$credits_cam.enabled = true


func _on_back_to_menu_pressed():
	$credits_cam.enabled = false


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
