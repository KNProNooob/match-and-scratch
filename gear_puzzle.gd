extends Node2D
var collision = false
@export var character : CharacterBody2D
var zoomed = false
@export var combination : Array[Sprite2D]
@export var combination2 : Array[Sprite2D]
var is_solved = false
var is_solved2 = false
func _on_interction_body_entered(body):
	collision = true

signal solved
signal un_solved
signal solved2
signal un_solved2
var speed = 10
func _on_interction_body_exited(body):
	collision = false

func _input(event):
	if event.is_action_pressed("interact"):
		if collision:
			if zoomed:
				$Camera2D.enabled = false
				get_node("../Camera/Camera2D").enabled = true
				character.moveable = true
				$inventory.hide()
				character.show()
				zoomed = false
			else:
				$Camera2D.enabled = true
				get_node("../Camera/Camera2D").enabled = false
				character.moveable = false
				if Global.small_gears > 0:
					$inventory/Small.show()
				if Global.medium_gears > 0:
					$inventory/medium.show()
				if Global.big_gears > 0:
					$inventory/big.show()
				$inventory.show()
				character.hide()
				zoomed = true


func _process(delta):
	#inventory check
	if Global.small_gears < 1:
		$inventory/Small.hide()
		$inventory/Small/Small_selected.hide()
		if Global.gear_selected == 1:
			Global.gear_selected = 0
	if Global.medium_gears < 1:
		$inventory/medium.hide()
		$inventory/medium/medium_selected.hide()
		if Global.gear_selected == 2:
			Global.gear_selected = 0
	if Global.big_gears < 1:
		$inventory/big.hide()
		$inventory/big/big_selected.hide()
		if Global.gear_selected == 3:
			Global.gear_selected = 0
	
	if Global.small_gears > 0:
		$inventory/Small.show()
	if Global.medium_gears > 0:
		$inventory/medium.show()
	if Global.big_gears > 0:
		$inventory/big.show()
	
	
	#rotation

	var i = 0
	for gear in combination:
		if gear.visible:
			if i % 2 == 0:
				gear.rotation += delta * speed
			else:
				gear.rotation -= delta * speed
			i += 1
		else:
			if is_solved:
				emit_signal("un_solved")
				is_solved = false
			break
		if i == combination.size() and (is_solved == false):
			emit_signal("solved")
			is_solved = true
	i = 1
	for gear in combination2:
		if gear.visible:
			if i % 2 == 0:
				gear.rotation += delta * speed
			else:
				gear.rotation -= delta * speed
			i += 1
		else:
			if is_solved2:
				emit_signal("un_solved2")
				
				is_solved2 = false
			break
		if i == combination2.size() and (is_solved2 == false):
			print("aaa")
			emit_signal("solved2")
			is_solved2 = true
