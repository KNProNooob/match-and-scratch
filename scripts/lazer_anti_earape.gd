extends Node
@export var reseter = false
func _ready():
	var index = AudioServer.get_bus_index("lazer")
	if reseter:
		AudioServer.set_bus_volume_db(index, 0)
	else:
		AudioServer.set_bus_volume_db(index, -60)
