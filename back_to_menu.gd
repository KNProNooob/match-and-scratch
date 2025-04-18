extends Node2D

func _input(event):
	if event.is_action_pressed("esc"):
		$Timer.start()
	if event.is_action_released("esc"):
		$Timer.stop()




func _on_timer_timeout():
	get_tree().change_scene_to_file("res://main_menu.tscn")
