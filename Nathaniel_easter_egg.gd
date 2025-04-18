extends Node2D


func _on_timer_timeout():
	$RichTextLabel.show()


func _on_plate_1_stepped_on(id):
	$Timer.stop()
