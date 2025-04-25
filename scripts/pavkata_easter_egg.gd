extends RichTextLabel
@export var color : Color

func _ready():
	if randi_range(1, 100) <= 10:
		add_theme_color_override("default_color", color)
