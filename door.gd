extends StaticBody2D
var collision = false



func _on_area_2d_body_entered(body):
	collision = true
	



func _on_area_2d_body_exited(body):
	collision = false
	

func _input(event):
	if event.is_action_pressed("interact") or (event.is_action_pressed("click") and OS.get_name() == "Android"):
		if collision:
			if Global.key > 0:
				$CollisionShape2D.disabled = true
				$Area2D.monitoring = false
				$door_open.play()
				$Sprite2D.hide()
				Global.key -= 1
			
