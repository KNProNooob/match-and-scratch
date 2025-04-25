extends StaticBody2D


func on_signal(): #open
	$CollisionShape2D.set_deferred("disabled", true)
	$door_open.play()
	hide()

func close():
	$CollisionShape2D.set_deferred("disabled", false)
	$door_close.play()
	show()
