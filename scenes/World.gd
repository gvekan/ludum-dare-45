extends Node2D

var item = preload("res://scenes/Items/Item.tscn")
var legs_jeans = preload("res://assets/characters/jeans-legs.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_item = item.instance()
	new_item.ID = "legs"
	new_item.get_node("Sprite").texture = legs_jeans
	new_item.position = Vector2(100, 100)
	add_child(new_item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
