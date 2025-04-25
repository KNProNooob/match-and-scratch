extends Area2D
signal click(pos)
func _on_texture_button_pressed():
	emit_signal("click", position)
