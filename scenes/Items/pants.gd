extends Area2D

export var value = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",self,"_on_pants_body_entered")

#Called when object collides with pants
func _on_pants_body_entered(body):
	print("Collected pants")
