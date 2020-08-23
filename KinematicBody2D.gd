extends KinematicBody2D
#controls movement of MC sprite

var motion = Vector2()
var last_direction = Vector2(0, 1) #default pointing down

func get_direction(direction: Vector2):
	var norm_direction = direction.normalized()
	if norm_direction.y >= 0.707:
		return "down"
	elif norm_direction.y <= -0.707:
		return "up"
	elif norm_direction.x <= -0.707:
		return "left"
	elif norm_direction.x >= 0.707:
		return "right"
	return "down"


func _physics_process(delta):
	
	var mcSprite = get_node("MCSprite")
	
	if Input.is_action_pressed("ui_right"): 
		# right arrow key pressed
		$MCSprite.play("walking_right")
		motion.x = 200 
		last_direction = motion
		#motion increases by 100 pixels per sec to the right
		
	elif Input.is_action_pressed("ui_left"):
		# left arrow key pressed
		$MCSprite.play("walking_left")
		motion.x = -200
		last_direction = motion
		
	elif Input.is_action_pressed("ui_up"):
		# up arrow key pressed
		$MCSprite.play("walking_back")
		motion.y = -200
		last_direction = motion
		
	elif Input.is_action_pressed("ui_down"):
		# down arrow key pressed
		$MCSprite.play("walking_front")
		motion.y = 200
		last_direction = motion
	
	#Ivy's bit (god i hope i don't mess this up)
	elif Input.is_action_just_released("ui_accept"):
		get_node("../Environment/BridgeTileMap").place_tile(position, get_direction(last_direction))
	
	else:
		motion.x = 0
		motion.y = 0
		var animation = get_direction(last_direction)
		
		if (animation == "down"):
			$MCSprite.play("idle_front")
		elif (animation == "up"):
			$MCSprite.play("idle_back")
		elif (animation == "left"):
			$MCSprite.play("idle_left")
		else:
			$MCSprite.play("idle_right")
		
	
	move_and_slide(motion)
	


