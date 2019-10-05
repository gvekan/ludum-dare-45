extends KinematicBody2D

export var speed = 200

var animation = ""

func move(x, y):
	if x > 0:
		animation = "right"
	elif x < 0:
		animation = "left"
	elif y > 0:
		animation = "down"
	elif y < 0:
		animation = "up"
	else:
		$AnimationPlayer.stop()
		return
	$AnimationPlayer.play(animation)
	var velocity = Vector2(x, y).normalized() * speed
	
	move_and_slide(velocity)
