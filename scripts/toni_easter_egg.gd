extends Node2D
var i = 0
var colors = [Color.BLUE, Color.RED, Color.GREEN, Color.YELLOW, Color.BLACK, Color.WHITE]
func _ready():
	$Timer.wait_time = Global.time
	$Timer.start()
func _process(delta):
	for timer in $timer_texts.get_children():
		timer.text = str(snapped($Timer.get_time_left(), 0.0001))

func _input(event):
	if event.is_action_pressed("click"):
		var timer = RichTextLabel.new()
		$timer_texts.add_child(timer)
		timer.position.x = randi_range(0, 1152)
		timer.position.y = randi_range(0, 720)
		timer.rotation_degrees = randi_range(0, 360)
		timer.size.x = 488
		timer.size.y = 128
		timer.scale.x = randi_range(1, 3)
		timer.scale.y = randi_range(1, 3)
		timer.add_theme_font_size_override("normal_font_size", 50)
		timer.add_theme_color_override("default_color", colors.pick_random())
	if event.is_action_pressed("esc"):
		get_tree().change_scene_to_file("res://scenes/ending.tscn")


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
