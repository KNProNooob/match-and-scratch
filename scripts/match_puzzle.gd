extends Node2D

var collision = false
var zoomed
@export var character : CharacterBody2D
@export var skipable = false
@export var active = true
var clicked_id = null
var number_solved = 0
var num_clicked = 0
@export var solve_requirement = 1
signal solved
func _on_interaction_body_entered(body):
	collision = true


func _on_interaction_body_exited(body):
	collision = false
	
func _input(event):
	if event.is_action_pressed("interact"):
		if collision:
			if zoomed:
				$Camera2D.enabled = false
				get_node("../Camera/Camera2D").enabled = true
				character.moveable = true
				zoomed = false
			else:
				$Camera2D.enabled = true
				get_node("../Camera/Camera2D").enabled = false
				character.moveable = false
				zoomed = true
			
			


func _on_button_click(id):
	if active:
		if $Timer.is_stopped():
			if clicked_id == null:
				clicked_id = id
			elif clicked_id != id:
				$Timer.start()
			elif clicked_id == id:
				number_solved += 1
				clicked_id = null
				
			if skipable and num_clicked == 100:
				emit_signal("solved")
			num_clicked += 1
			
			if number_solved == solve_requirement:
				emit_signal("solved")
				print("solved")
	else:
		_on_timer_timeout()
		
func activate():
	active = true
			
func _on_timer_timeout():
	number_solved = 0
	clicked_id = null
	for button in get_node("buttons").get_children():
		button.clicked = false
		get_node(str(button.get_path()) + "/clicked").hide()
