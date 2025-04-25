extends Area2D
var collision = false
@export var activated = false
signal on
signal off

func _on_body_entered(body):
	collision = true
	print(collision)


func _on_body_exited(body):
	collision = false
	print(collision)
	
func _input(event):
	if event.is_action_pressed("interact") or (OS.get_name() == "Android" and event.is_action_pressed("click")):
		if collision:
			if activated == false:
				activated = true
				emit_signal("on")
				$AnimatedSprite2D.play("on")
			else:
				activated = false
				emit_signal("off")
				$AnimatedSprite2D.play("off")
