extends Node2D
var collision = false
var zoomed = false
signal solved
signal solved2
@export var character : CharacterBody2D
@export var positions :Array[Vector2]

@export var solved_order: Array[Area2D]
@export var solved_order2: Array[Area2D]
@export var scrambled_order: Array[Area2D]
	

func _on_area_2d_body_entered(body):
	collision = true


func _on_area_2d_body_exited(body):
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

func check():
	print("checking")
	var size = solved_order.size()
	var j = 0
	for i in solved_order:
		if i == scrambled_order[j]:
			j += 1
		else:
			break
	if j == size:
		print("solved")
		emit_signal("solved")
	else:
		if solved_order2 != null:
			j = 0
			for i in solved_order2:
				if i == scrambled_order[j]:
					j += 1
				else:
					break
		if j == size:
			print("solved")
			emit_signal("solved2")
		
	
func _on_plate_click(pos):
	var place = positions.find(pos)
	var rows = sqrt(positions.size())
	if pos.x > positions.min().x and scrambled_order[place - 1] == null:
		scrambled_order[place].position = positions[place - 1]
		scrambled_order[place - 1] = scrambled_order[place]
		scrambled_order[place] = null
	elif pos.x < positions.max().x and scrambled_order[place + 1] == null:
		scrambled_order[place].position = positions[place + 1]
		scrambled_order[place + 1] = scrambled_order[place]
		scrambled_order[place] = null
	elif pos.y > positions.min().y and scrambled_order[place - rows] == null:
		scrambled_order[place].position = positions[place - rows]
		scrambled_order[place - rows] = scrambled_order[place]
		scrambled_order[place] = null
	elif pos.y < positions.max().y and scrambled_order[place + rows] == null:
		scrambled_order[place].position = positions[place + rows]
		scrambled_order[place + rows] = scrambled_order[place]
		scrambled_order[place] = null
	check()
