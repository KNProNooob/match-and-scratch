extends CharacterBody2D
var speed = 100
var mobile_velocity = 0
@export var moveable = true
func _process(delta):
	if OS.get_name() != "Android":
		velocity.x = Input.get_axis("left", "right") * speed * delta
		velocity.y = Input.get_axis("forward", "backwards") * speed * delta
	else:
		velocity = mobile_velocity * delta * speed
	if moveable:
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("back")
		elif velocity.x > 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("back")
		elif velocity.y > 0:
			$AnimatedSprite2D.play("back")
		elif velocity.y < 0:
			$AnimatedSprite2D.play("forward")
		else:
			$AnimatedSprite2D.play("default")
		
		if velocity.x != 0 or velocity.y != 0:
			move_and_collide(velocity)


func _input(event):
	if event.is_action_pressed("sprint"):
		speed = 200
	elif event.is_action_released("sprint"):
		speed = 100



func _on_mobile_controls_movement(movement):
	mobile_velocity = movement


func _on_mobile_controls_sprint(new_speed):
	speed = new_speed
