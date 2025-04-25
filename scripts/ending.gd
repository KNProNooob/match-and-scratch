extends Node2D

func _ready():
	var config = ConfigFile.new()
	if config.load_encrypted_pass("user://save.txt", "bWFqa2EgemFqa2E=") == OK:
		config.set_value("data", "level", null)
		config.set_value("data", "time", null)
		config.set_value("data", "completed", true)
		config.save_encrypted_pass("user://save.txt", "bWFqa2EgemFqa2E=")
	
	$completion_time_text.text = "[center]"
	var secs = Global.time
	var mins = 0
	var hours = 0
	if secs > 59:
		mins = secs / 60
		secs = secs % 60
		if mins > 59:
			hours = mins / 60
			mins = mins % 60
	
	if hours < 10:
		$completion_time_text.text += "0" + str(hours) + " : "
	else:
		$completion_time_text.text += str(hours) + " : "
	
	if mins < 10:
		$completion_time_text.text += "0" + str(mins) + " : "
	else:
		$completion_time_text.text += str(mins) + " : "
		
	if secs < 10:
		$completion_time_text.text += "0" + str(secs)
	else:
		$completion_time_text.text += str(secs)
	

	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_upload_pressed():
	$upload.text = "Uploading..."
	$upload.disabled = true
	$name.editable = false
	$Button.disabled = true
	
	$GameJoltAPI.scores_add(str(Global.time) + " Seconds", Global.time, $name.text, 899364)
	
func _on_name_text_changed(new_text):
	if $name.text == "":
		$upload.disabled = true
	else:
		$upload.disabled = false


func _on_request_completed(request_type, response):
	print(response)
	if OS.get_name() == "Web":
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	else:
		if response["success"] == false:
			print(response)
			$upload.text = "Try again"
			$upload.disabled = false
			$name.editable = true
			$Button.disabled = false
			$error.show()
		else:
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_toni_easter_egg_button_pressed():
	get_tree().change_scene_to_file("res://scenes/toni_easter_egg.tscn")
