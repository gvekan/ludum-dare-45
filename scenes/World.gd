extends Node2D

#signal has_correct_outfit
signal outfit_changed

const LEGS_ID = "legs"
const HEAD_ID = "head"
const UPPER_BODY_ID = "upper"
const FEET_ID = "feet"

var level = 1

var legs_item = preload("res://scenes/Items/LegsItem.tscn")
var head_item = preload("res://scenes/Items/HeadItem.tscn")
var upper_item = preload("res://scenes/Items/UpperItem.tscn")
var feet_item = preload("res://scenes/Items/FeetItem.tscn")
var npc = preload("res://scenes/Characters/NPC/NPC.tscn")
var player_outfit = {}
var has_correct_outfit = false
var rng = RandomNumberGenerator.new()


# TODO: Create timer for points
# TODO: Make game harder by creating bigger FOV for NPC and more NPC

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var new_item
	for texture in $HUD/Fashion.legs:
		add_item("legs", texture, legs_item.instance())
		
	for texture in $HUD/Fashion.feet:
		add_item("feet", texture, feet_item.instance())
		
	for texture in $HUD/Fashion.upper_body:
		add_item("upper", texture, upper_item.instance())
		
	for texture in $HUD/Fashion.head:
		add_item("head", texture, head_item.instance())
	
	player_outfit[LEGS_ID] = $YSort/Player/Legs.texture
	player_outfit[FEET_ID] = $YSort/Player/Feet.texture
	player_outfit[UPPER_BODY_ID] = $YSort/Player/UpperBody.texture
	player_outfit[HEAD_ID] = $YSort/Player/Head.texture
	
	new_outfit()
		
	add_npc()
	
	$ChangeDirectionTimer.start()
	$FOVTimer.start()


func check_correct_outfit():
	for ID in [LEGS_ID, FEET_ID, UPPER_BODY_ID, HEAD_ID]:
		if $HUD/Fashion.outfit[ID] != player_outfit[ID]:
			return false
		 
	return  true
	
	
	
func get_random_pos_inbounds():
	return Vector2(rng.randi_range(32, 900), rng.randi_range(32, 570))

func add_item(ID, texture, new_item):
	new_item.ID = ID
	new_item.get_node("Sprite").texture = texture
	new_item.position = get_random_pos_inbounds()
	add_child(new_item)
	new_item.connect("texture_changed", self, "update_texture")
	#new_item.connect("overlapping",self,"item_overlapping")
	
func new_outfit():
	while check_correct_outfit():
		$HUD/Fashion.new_outfit()
	emit_signal("outfit_changed", $HUD/Fashion.outfit)
#func item_overlapping(item):
#	item.position = Vector2(rng.randi_range(32, 900), rng.randi_range(32, 570))

func update_texture(ID, texture):
	player_outfit[ID] = texture
	if ID == LEGS_ID:
		add_item("legs", texture, legs_item.instance())
	elif ID == FEET_ID:
		add_item("feet", texture, feet_item.instance())
	elif ID == UPPER_BODY_ID:
		add_item("upper", texture, upper_item.instance())
	elif ID == HEAD_ID:
		add_item("head", texture, head_item.instance())
	if check_correct_outfit():
		new_outfit()
		$YSort/Player.on_level_complete()
		add_npc()
		level += 1
		$HUD/LevelLabel.text = "LEVEL %s" % level

func add_npc():
	var new_npc = npc.instance()
	new_npc.position = get_random_pos_inbounds()
	new_npc.change_outfit($HUD/Fashion.outfit)
	$YSort.add_child(new_npc)
	self.connect("outfit_changed", new_npc, "change_outfit")
	$ChangeDirectionTimer.connect("timeout", new_npc, "change_direction")
	$FOVTimer.connect("timeout", new_npc, "increase_fov")
	

func _on_Player_died():
	$FOVTimer.stop()
	$HUD/Restart.visible = true
	
	

func _on_Restart_pressed():
	get_tree().change_scene("res://scenes/world.tscn")
