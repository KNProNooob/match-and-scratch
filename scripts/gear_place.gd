extends Area2D
@export var gear_in = 0
signal click(pos)



func _on_texture_button_pressed():
	if gear_in == 0:
		if Global.gear_selected == 1:
			$Small.show()
			gear_in = 1
			Global.small_gears -= 1
		elif Global.gear_selected == 2:
			$medium.show()
			gear_in = 2
			Global.medium_gears -= 1
		elif Global.gear_selected == 3:
			$big.show()
			gear_in = 3
			Global.big_gears -= 1
	else:
		if gear_in == 1:
			$Small.hide()
			Global.small_gears += 1
		elif gear_in == 2:
			$medium.hide()
			Global.medium_gears += 1
		elif gear_in == 3:
			$big.hide()
			Global.big_gears += 1
		gear_in = 0
