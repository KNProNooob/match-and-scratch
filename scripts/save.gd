extends Node2D
@export var level = 0
var config = ConfigFile.new()

func _ready():
	if config.load_encrypted_pass("user://save.txt", "bWFqa2EgemFqa2E=") == OK:
		config.set_value("data", "level", level)
		config.set_value("data", "time", Global.time)
		config.save_encrypted_pass("user://save.txt", "bWFqa2EgemFqa2E=")
	else:
		config.set_value("data", "level", level)
		config.set_value("data", "time", Global.time)
		config.save_encrypted_pass("user://save.txt", "bWFqa2EgemFqa2E=")
	Global.level = level
	Global.key = 0
	Global.small_gears = 0
	Global.medium_gears = 0
	Global.big_gears = 0
	Global.gear_selected = 0
	
