extends KinematicBody2D
#controls movement of MC sprite

var motion = Vector2()

var mcFront = preload("res://assets/main_char_front_sprite.png")
var mcBack = preload("res://assets/main_char_back_sprite.png")
var mcRight = preload("res://assets/main_char_rightside_sprite.png")
var mcLeft = preload("res://assets/main_char_leftside_sprite.png")


func _physics_process(delta):
	
	var mcSprite = get_node("MCSprite")
	
	if Input.is_action_pressed("ui_right"): 
		# right arrow key pressed
		mcSprite.set_texture(mcRight)
		motion.x = 150 
		
		#motion increases by 100 pixels per sec to the right
		
	elif Input.is_action_pressed("ui_left"):
		# left arrow key pressed
		mcSprite.set_texture(mcLeft)
		motion.x = -150
		
	elif Input.is_action_pressed("ui_up"):
		# up arrow key pressed
		mcSprite.set_texture(mcBack)
		motion.y = -150
		
	elif Input.is_action_pressed("ui_down"):
		# down arrow key pressed
		mcSprite.set_texture(mcFront)
		motion.y = 150
	
	else:
		motion.x = 0
		motion.y = 0
		
	
	move_and_slide(motion)
	

