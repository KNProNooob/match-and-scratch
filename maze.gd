extends Node2D

@export var on = true

func _ready():
	if on == false:
		for child in get_children():
			child.hide()
			get_node(str(child.get_path()) + "/StaticBody2D/CollisionShape2D").disabled = true


func toggle():
	for child in get_children():
		if child.visible == true:
			child.hide()
			get_node(str(child.get_path()) + "/StaticBody2D/CollisionShape2D").disabled = true
			get_node(str(child.get_path()) + "/off").play()
		else:
			child.show()
			get_node(str(child.get_path()) + "/StaticBody2D/CollisionShape2D").disabled = false
			get_node(str(child.get_path()) + "/on").play()
