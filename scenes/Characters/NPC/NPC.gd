extends "res://scenes/Characters/Character.gd"

export var move_duration = 2
export var hit_radius = 20
export var damage = 1

var follow
var x = 0
var y = 0
var stopwatch = 1


func _ready():
	randomize()

func _physics_process(delta):
	if follow == null or follow.is_dead:
		stopwatch += delta
		if stopwatch >= move_duration:
			x = (randi() % 3) - 1
			y = (randi() % 3) - 1
			stopwatch = 0
		move(x, y)
		return
		
	# TODO: Do nothing if has the right cloths 
	# TODO 2: Use raycast to not see throught obstacles
	
	var motion = follow.position - position
	var fight = 0
	if motion.length() < hit_radius:
		fight = motion.x
		follow.hit(damage)
	move(motion.x, motion.y, fight)

func _on_FOV_body_entered(body):
	if body.name == "Player":
		
		follow = body


func _on_FOV_body_exited(body):
	if body == follow:
		follow = null
