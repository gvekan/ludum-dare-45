extends Area2D

export var ID = "legs"

func _ready():
	connect("body_entered",self,"_on_item_body_entered")

#Called when object collides with pants
func _on_item_body_entered(body):
	if body.name == "Player":
		queue_free()
		body.append_item(ID, $Sprite.texture)
