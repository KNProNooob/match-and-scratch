extends Area2D

var collision = false

func _on_body_entered(body):
	
	collision = true


func _on_body_exited(body):
	collision = false
	
func _input(event):
	if event.is_action_pressed("interact") or (event.is_action_pressed("click") and OS.get_name() == "Android"):
		if collision:
			hide()
			monitoring = false
			Global.key += 1
