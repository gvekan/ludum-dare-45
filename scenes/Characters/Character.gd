extends KinematicBody2D

export var speed = 200

var character_animations = []

var is_f = true
var is_l = true

func _ready():
	character_animations.append($Legs)
	character_animations.append($Head)
	character_animations.append($Feet)
	character_animations.append($UpperBody)

func move(x, y, fight = 0): 
	var animation = "still_f"
	var is_run = y != 0 or x != 0
	if y != 0:
		is_f = y > 0
	if x != 0:
		is_l = x < 0
	if is_run:
		if is_f:
			animation = "run_f"
		else:
			animation = "run_b"
	elif not is_f:
		animation = "still_b"
	for ca in character_animations:
		if fight != 0 and ca.name == "UpperBody":
			if is_f:
				ca.set_flip_h(fight > 0)
				ca.get_node("AnimationPlayer").play("fight_f")
			else:
				ca.set_flip_h(fight < 0)
				ca.get_node("AnimationPlayer").play("fight_b")
		else:
			if is_f:
				ca.set_flip_h(!is_l)
			else:
				ca.set_flip_h(is_l)
			ca.get_node("AnimationPlayer").play(animation)
	if is_run:
		var velocity = Vector2(x, y).normalized() * speed
		move_and_slide(velocity)

func append_item(ID, texture):
	if ID == "legs":
		$Legs.texture = texture
	elif ID == "feet":
		$Feet.texture = texture
	elif ID == "head":
		$Head.texture = texture
	elif ID == "upper":
		$UpperBody.texture = texture
		
func change_outfit(outfit):
	$Legs.texture = outfit["legs"]
	$Feet.texture = outfit["feet"]
	$Head.texture = outfit["head"]
	$UpperBody.texture = outfit["upper"]
	