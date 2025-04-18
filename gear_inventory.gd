extends Panel


func _on_small_click():
	$Small/Small_selected.show()
	$medium/medium_selected.hide()
	$big/big_selected.hide()
	Global.gear_selected = 1

func _on_medium_click():
	print("aaa")
	$Small/Small_selected.hide()
	$medium/medium_selected.show()
	$big/big_selected.hide()
	Global.gear_selected = 2

func _on_big_click():
	$Small/Small_selected.hide()
	$medium/medium_selected.hide()
	$big/big_selected.show()
	Global.gear_selected = 3
