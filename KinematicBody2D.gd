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

var accept_input = false
var entrance_animate = false
var animate_time_elapsed = 0.0

func _ready():
	hide()
	

func _physics_process(delta):
	
	var mcSprite = get_node("MCSprite")
	
	if !accept_input:
		if entrance_animate:
			
			_animate_entrance(delta)
		
		return
	
	if Input.is_action_pressed("ui_right"): 
		# right arrow key pressed
		
		$MCSprite.play("walking_right")
		
		if not $Walking.is_playing():
			$Walking.play()
			
		motion.x = 200 
		last_direction = motion
		#motion increases by 100 pixels per sec to the right
		
	elif Input.is_action_pressed("ui_left"):
		# left arrow key pressed
		$MCSprite.play("walking_left")
		
		if not $Walking.is_playing():
			$Walking.play()
		
		motion.x = -200
		last_direction = motion
		
	elif Input.is_action_pressed("ui_up"):
		# up arrow key pressed
		$MCSprite.play("walking_back")
		if not $Walking.is_playing():
			$Walking.play()
		
		motion.y = -200
		last_direction = motion
		
	elif Input.is_action_pressed("ui_down"):
		# down arrow key pressed
		$MCSprite.play("walking_front")
		if not $Walking.is_playing():
			$Walking.play()
		
		motion.y = 200
		last_direction = motion
	
	#Ivy's bit (god i hope i don't mess this up)
	elif Input.is_action_just_released("ui_accept"):
		get_node("../Environment/BridgeTileMap").place_tile(position, get_direction(last_direction))
		$Sparkling.play()
		
	elif Input.is_action_just_released("ui_delete"):
		get_node("../Environment/BridgeTileMap").delete_tile(position, get_direction(last_direction))
		$Delete.play()
	
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
	


func _animate_entrance(delta):
	
	
	if animate_time_elapsed < 1:
		pass
		
	
	elif animate_time_elapsed < 1.5:
		show()
	
	elif animate_time_elapsed < 2:
		
		move_and_slide(Vector2(40,150))
		$MCSprite.play("walking_front")
		
	else:
		entrance_animate = false
		accept_input = true
	
	
	
	animate_time_elapsed += delta
	
	



