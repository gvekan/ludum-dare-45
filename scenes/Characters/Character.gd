extends KinematicBody2D

export var speed = 200



var is_f = true

func move(x, y): 
	var animation = "still_f"
	var is_run = y != 0 or x != 0
	if y != 0:
		is_f = y > 0
	if is_f:
		get_node("Sprite").set_flip_h(x > 0)
	else:
		get_node("Sprite").set_flip_h(x < 0)
	if is_run:
		if is_f:
			animation = "run_f"
		else:
			animation = "run_b"
	elif not is_f:
		animation = "still_b"

	$AnimationPlayer.play(animation)
	if is_run:
		var velocity = Vector2(x, y).normalized() * speed
		move_and_slide(velocity)
	