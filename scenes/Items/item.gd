extends Area2D

export var ID = "legs"

func _ready():
	connect("body_entered",self,"_on_item_body_entered")

#Called when object collides with pants
func _on_item_body_entered(body):
	queue_free()
	if body.name == "Player":
		body.append_item(ID, $Sprite.texture)
