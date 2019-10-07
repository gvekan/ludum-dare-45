extends "res://scenes/Characters/Character.gd"

#export var move_duration = 2
#export var wait_to_increase = 1
export var hit_radius = 20
export var damage = 1
export var fov_radius = 100 
export var fov_increasion = 1

var has_correct_outfit = false

var follow
var x = 0
var y = 0
#var move_timer = move_duration
#var increase_timer = wait_to_increase
var can_hit = true

func _ready():
	randomize()

func _physics_process(delta):
	#increase_timer += delta
	#if increase_timer >= wait_to_increase:
	#	$FOV/CollisionShape2D.shape.radius += 1
	#	increase_timer = 0
	if follow == null or follow.is_dead or has_correct_outfit:
		#move_timer += delta
		#if move_timer >= move_duration:
			#move_timer = 0
		move(x, y)
		return
		
	# TODO: Do nothing if has the right cloths 
	# TODO 2: Use raycast to not see throught obstacles
	
	var motion = follow.position - position
	var fight = 0
	if motion.length() < hit_radius:
		fight = motion.x
		if can_hit:
			follow.hit(damage)
			can_hit = false
			$HitCooldown.start()
	move(motion.x, motion.y, fight)

func _on_FOV_body_entered(body):
	if body.name == "Player":
		follow = body


func _on_FOV_body_exited(body):
	if body == follow:
		follow = null

func _on_player_has_correct_outfit():
	has_correct_outfit = true

func has_wrong_outfit():
	has_correct_outfit = false

func change_outfit(outfit):
	$FOV/CollisionShape2D.shape.radius = fov_radius
	.change_outfit(outfit)

func _on_HitCooldown_timeout():
	can_hit = true
	$HitCooldown.stop()
	
func change_direction():
	if follow == null or follow.is_dead or has_correct_outfit:
		x = (randi() % 3) - 1
		y = (randi() % 3) - 1

func increase_fov():
	$FOV/CollisionShape2D.shape.radius += fov_increasion
	
