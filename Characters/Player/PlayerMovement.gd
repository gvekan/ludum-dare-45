extends KinematicBody2D

export var speed = 200




var last_horizontal_input = ""
var last_vertical_input = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var motion = Vector2(0, 0)
	if Input.is_action_just_pressed("ui_left"):
		last_horizontal_input = "ui_left"
	elif Input.is_action_just_pressed("ui_right"):
		last_horizontal_input = "ui_right"
	elif not Input.is_action_pressed(last_horizontal_input):
		if Input.is_action_pressed("ui_left"):
			last_horizontal_input = "ui_left"
		elif Input.is_action_pressed("ui_right"):
			last_horizontal_input = "ui_right"
		else:
			last_horizontal_input = ""
	
	if last_horizontal_input == "ui_left":
		motion.x = -speed
	elif last_horizontal_input == "ui_right":
		motion.x = speed
		

	if Input.is_action_just_pressed("ui_up"):
		last_vertical_input = "ui_up"
	elif Input.is_action_just_pressed("ui_down"):
		last_vertical_input = "ui_down"
	elif not Input.is_action_pressed(last_vertical_input):
		if Input.is_action_pressed("ui_up"):
			last_vertical_input = "ui_up"
		elif Input.is_action_pressed("ui_down"):
			last_vertical_input = "ui_down"
		else:
			last_vertical_input = ""
	
	if last_vertical_input == "ui_up":
		motion.y = -speed
	elif last_vertical_input == "ui_down":
		motion.y = speed
	
	move_and_slide(motion)
