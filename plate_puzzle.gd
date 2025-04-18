extends Node2D
@export var Combination : Array[int]
var i = 0
signal solved
signal failed
var is_solved = false
func stepped_on(id):
	if Combination[i] == id:
		i += 1
		print(i)
	else:
		if Combination[0] == id:
			i = 1
		else:
			i = 0
			if is_solved:
				emit_signal("failed")
				is_solved = false
		print(i)
	if i == Combination.size():
		i = 0
		emit_signal("solved")
		is_solved = true
		print("solved")
