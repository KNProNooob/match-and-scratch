extends Area2D


func _on_body_entered(body):
	$Camera2D.enabled = true



func _on_body_exited(body):
	$Camera2D.enabled = false
