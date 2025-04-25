extends Area2D

@export var id = 0
signal stepped_on(id)



func _on_body_entered(body):
	emit_signal("stepped_on", id)
