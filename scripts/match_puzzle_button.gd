extends Area2D
@export var id = 0 
@export var clicked = false
signal click(id)

func _on_texture_button_pressed():
	if clicked == false:
		$clicked.show()
		if has_node("clicked/audio"):
			$clicked/audio.play()
		clicked = true
		emit_signal("click", id)
