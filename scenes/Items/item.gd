extends Area2D

export var ID = "legs"

#signal overlapping

signal texture_changed

func _ready():
	connect("body_entered",self,"_on_item_body_entered")

#Called when object collides with pants
func _on_item_body_entered(body):
	if body.name == "Player":
		queue_free()
		body.append_item(ID, $Sprite.texture)
		emit_signal("texture_changed", ID, $Sprite.texture)
	#elif body.name != "NPC":
	#	emit_signal("overlapping", self)
	
