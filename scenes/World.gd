extends Node2D

signal has_correct_outfit
signal has_wrong_outfit

var legs_item = preload("res://scenes/Items/LegsItem.tscn")
var head_item = preload("res://scenes/Items/HeadItem.tscn")
var upper_item = preload("res://scenes/Items/UpperItem.tscn")
var feet_item = preload("res://scenes/Items/FeetItem.tscn")
var player_outfit = []
var has_correct_outfit = false

# TODO: Generate new fashion when has_correct_outfit after timer
# TODO: Create same item as taken somewhere else
# TODO: Create timer for points
# TODO: Make game harder by creating bigger FOV for NPC and more NPC

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var new_item
	for texture in $HUD/Fashion.legs:
		new_item = legs_item.instance()
		new_item.ID = "legs"
		new_item.get_node("Sprite").texture = texture
		new_item.position = Vector2(randi() % 900, randi() % 500)
		add_child(new_item)
		new_item.connect("texture_changed", self, "update_texture")
		
	for texture in $HUD/Fashion.feet:
		new_item = feet_item.instance()
		new_item.ID = "feet"
		new_item.get_node("Sprite").texture = texture
		new_item.position = Vector2(randi() % 900, randi() % 500)
		add_child(new_item)
		new_item.connect("texture_changed", self, "update_texture")
		
	for texture in $HUD/Fashion.upper_body:
		new_item = upper_item.instance()
		new_item.ID = "upper"
		new_item.get_node("Sprite").texture = texture
		new_item.position = Vector2(randi() % 900, randi() % 500)
		add_child(new_item)
		new_item.connect("texture_changed", self, "update_texture")
		
	for texture in $HUD/Fashion.head:
		new_item = head_item.instance()
		new_item.ID = "head"
		new_item.get_node("Sprite").texture = texture
		new_item.position = Vector2(randi() % 900, randi() % 500)
		add_child(new_item)
		new_item.connect("texture_changed", self, "update_texture")
	
	player_outfit.append(get_node("YSort/Player/Legs").texture)
	player_outfit.append(get_node("YSort/Player/Feet").texture)
	player_outfit.append(get_node("YSort/Player/UpperBody").texture)
	player_outfit.append(get_node("YSort/Player/Head").texture)
	
	while check_correct_outfit():
		$HUD/Fashion.new_outfit()


func check_correct_outfit():
	return $HUD/Fashion.outfit == player_outfit


func update_texture(ID, texture):
	if ID == "legs":
		player_outfit[0] = texture
	elif ID == "feet":
		player_outfit[1] = texture
	elif ID == "upper":
		player_outfit[2] = texture
	elif ID == "head":
		player_outfit[3] = texture
	if check_correct_outfit():
		has_correct_outfit = true
		emit_signal("has_correct_outfit")
		print("Correct outfit!!!")


func _on_Player_died():
	pass # Replace with function body.
