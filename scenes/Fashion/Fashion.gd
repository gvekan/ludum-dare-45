extends Node2D
var rng = RandomNumberGenerator.new()

#Leg fashions
var legs_jeans = preload("res://assets/characters/jeans-legs.png")
var legs_naked = preload("res://assets/characters/naked-legs.png")

enum leg_fashion{
	JEANS,
	NAKED
}

#Feet fashoins
var feet_sneakers = preload("res://assets/characters/sneakers-feets.png")
var feet_naked = preload("res://assets/characters/naked-feets.png")

enum feet_fashion{
	SNEAKERS,
	NAKED
}

#UpperBody fashions
var upper_naked = preload("res://assets/characters/naked-upper-body.png")
var upper_red_white = preload("res://assets/characters/stripe-red-white-upper-body.png")
var upper_blue = preload("res://assets/characters/blue-upper-body.png")

enum upper_fashion{
	RED_WHITE,
	BLUE,
	NAKED
}

#Head fashion
var head_naked = preload("res://assets/characters/naked-head.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	
	var leg = rng.randi_range (0,leg_fashion.size()-1)
	print(leg_fashion.JEANS)
	if leg == leg_fashion.JEANS:
		$Legs.texture = legs_jeans
	elif leg == leg_fashion.NAKED:
		$Legs.texture = legs_naked
		
	var feet = rng.randi_range (0,feet_fashion.size()-1)
	if feet == feet_fashion.SNEAKERS:
		$Feet.texture = feet_sneakers
	elif feet == feet_fashion.NAKED:
		$Feet.texture = feet_naked
		
	var upper = rng.randi_range (0,upper_fashion.size()-1)
	if upper == upper_fashion.RED_WHITE:
		$UpperBody.texture = upper_red_white
	elif upper == upper_fashion.BLUE:
		$UpperBody.texture = upper_blue
	elif upper == upper_fashion.NAKED:
		$UpperBody.texture = upper_naked
	
	get_node("Head").texture = head_naked

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
