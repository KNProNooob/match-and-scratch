extends Node2D

func _input(event):
	if event.is_action_pressed("forward"):
		$movement.hide()
	if event.is_action_pressed("interact"):
		$interact.hide()
	if event.is_action_pressed("sprint"):
		$sprint.hide()

func _on_interact_area_body_entered(body):
	$interact.show()
	$interact_area/CollisionShape2D.disabled = true
	



func _on_sprint_area_body_entered(body):
	$sprint.show()
	$sprint_area/CollisionShape2D.disabled = true
