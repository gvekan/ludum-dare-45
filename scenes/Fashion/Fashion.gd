extends Node2D
var rng = RandomNumberGenerator.new()

var outfit = {}

#Leg fashions
var legs = []


#Feet fashoins
var feet = []


#UpperBody fashions
var upper_body = []


#Head fashion
var head = []

# Called when the node enters the scene tree for the first time.
func _ready():
	legs.append(preload("res://assets/characters/jeans-legs.png"))
	legs.append(preload("res://assets/characters/underpants-legs.png"))
	#legs.append(preload("res://assets/characters/naked-legs.png"))
	feet.append(preload("res://assets/characters/sneakers-feets.png"))
	feet.append(preload("res://assets/characters/black-feet.png"))
	#feet.append(preload("res://assets/characters/naked-feets.png"))
	#upper_body.append(preload("res://assets/characters/naked-upper-body.png"))
	upper_body.append(preload("res://assets/characters/stripe-red-white-upper-body.png"))
	upper_body.append(preload("res://assets/characters/blue-upper-body.png"))
	#head.append(preload("res://assets/characters/naked-head.png"))
	head.append(preload("res://assets/characters/sweatband-head.png"))
	head.append(preload("res://assets/characters/hat-head.png"))
	rng.randomize()
	
	new_outfit()
	
func new_outfit():
	outfit = {}
	
	$Legs.texture = legs[rng.randi_range (0,legs.size()-1)]
	outfit["legs"] = $Legs.texture
		
	$Feet.texture = feet[rng.randi_range (0,feet.size()-1)]
	outfit["feet"] = $Feet.texture
		
	$UpperBody.texture = upper_body[rng.randi_range (0,upper_body.size()-1)]
	outfit["upper"] = $UpperBody.texture
	
	$Head.texture = head[rng.randi_range (0,head.size()-1)]
	outfit["head"] = $Head.texture
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
