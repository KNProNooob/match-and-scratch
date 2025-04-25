extends Node2D


func _on_plate_puzzle_3_solved():
	get_tree().change_scene_to_file("res://scenes/malinkata_easter_egg.tscn")
