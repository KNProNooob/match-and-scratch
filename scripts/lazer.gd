extends Node2D
var enabled = true

func _ready():
	if visible == false:
		$StaticBody2D/CollisionShape2D.disabled = true

func disable():
	$StaticBody2D/CollisionShape2D.disabled = true
	hide()
	$off.play()

func enable():
	$StaticBody2D/CollisionShape2D.disabled = false
	show()
	$on.play()

func toggle():
	if visible:
		disable()
	else:
		enable()
