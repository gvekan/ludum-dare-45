extends Node2D

var item = preload("res://scenes/Items/Item.tscn")
var legs_jeans = preload("res://assets/characters/jeans-legs.png")
var correct_fashion = []
var player_fashion = []
var is_correct_fashion = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_item = item.instance()
	new_item.ID = "legs"
	new_item.get_node("Sprite").texture = legs_jeans
	new_item.position = Vector2(100, 100)
	add_child(new_item)
	
	new_item.connect("texture_changed", self, "update_texture")
	
	player_fashion.append(get_node("YSort/Player/Feet").texture)
	player_fashion.append(get_node("YSort/Player/Head").texture)
	player_fashion.append(get_node("YSort/Player/UpperBody").texture)
	player_fashion.append(get_node("YSort/Player/Legs").texture)
	
	correct_fashion.append(get_node("Fashion/Feet").texture)
	correct_fashion.append(get_node("Fashion/Head").texture)
	correct_fashion.append(get_node("Fashion/UpperBody").texture)
	correct_fashion.append(get_node("Fashion/Legs").texture)
	if correct_fashion == player_fashion:
		is_correct_fashion = true
	else:
		is_correct_fashion = false
	print(is_correct_fashion)

func update_texture(ID, texture):
	if ID == "legs":
		player_fashion[0] = (get_node("YSort/Player/Feet").texture)
		player_fashion[1] = (get_node("YSort/Player/Head").texture)
		player_fashion[2] = (get_node("YSort/Player/UpperBody").texture)
		player_fashion[3] = texture
	elif ID == "feet":
		player_fashion[0] = texture
		player_fashion[1] = (get_node("YSort/Player/Head").texture)
		player_fashion[2] = (get_node("YSort/Player/UpperBody").texture)
		player_fashion[3] = (get_node("YSort/Player/Legs").texture)
	elif ID == "head":
		player_fashion[0] = (get_node("YSort/Player/Feet").texture)
		player_fashion[1] = texture
		player_fashion[2] = (get_node("YSort/Player/UpperBody").texture)
		player_fashion[3] = (get_node("YSort/Player/Legs").texture)
	elif ID == "upper":
		player_fashion[0] = (get_node("YSort/Player/Feet").texture)
		player_fashion[1] = (get_node("YSort/Player/Head").texture)
		player_fashion[2] = texture
		player_fashion[3] = (get_node("YSort/Player/Legs").texture)
	
	if correct_fashion == player_fashion:
		is_correct_fashion = true
	else:
		is_correct_fashion = false
	print(is_correct_fashion)
# Called every frame. 'delta' is the elapsed time since the previous frame.

