extends Node2D
var velocity : Vector2
var speed = 100
signal movement (movement : Vector2)
signal sprint (new_speed : int)
signal pause
func _ready():
	if OS.get_name() == "Android":
		show()
func _process(delta):
	if get_node("../Camera2D").enabled:
		scale.x = 1 / get_node("../Camera2D").zoom.x
		scale.y = 1 / get_node("../Camera2D").zoom.y
		position = get_node("../Camera2D").position

func _on_forward_pressed():
	velocity.y = -1
	emit_signal("movement", velocity)

func _on_forward_released():
	velocity.y = 0
	emit_signal("movement", velocity)


func _on_right_pressed():
	velocity.x = 1
	emit_signal("movement", velocity)


func _on_right_released():
	velocity.x = 0
	emit_signal("movement", velocity)


func _on_left_pressed():
	velocity.x = -1
	emit_signal("movement", velocity)


func _on_left_released():
	velocity.x = 0
	emit_signal("movement", velocity)


func _on_down_pressed():
	velocity.y = 1
	emit_signal("movement", velocity)


func _on_down_released():
	velocity.y = 0
	emit_signal("movement", velocity)


func _on_sprint_pressed():
	emit_signal("sprint", 200)
	
func _on_sprint_released():
	emit_signal("sprint", 100)
	



func _on_pause_pressed():
	emit_signal("pause")
