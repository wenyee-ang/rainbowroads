extends Control


var mc_dialogue = [
	".........Uhm........", 
	"Uh.........",
	"MR SPARKLES!", "I've been looking everywhere for you!", "Where did you find him?",
	"It was just in front of my house.... I guess he must have blown over.", "Thanks for bringing him home!",
	"I'm guessing that teddy was special to you", "Yeah, it's the only thing I have left from...well...you know.",
	"........Okay I'm going to go now.",
	"No, stay! Come inside for tea?",
	"...................................",
	"................................................................................................................................................................",
	"Okay."
]


var dialogue_index = 0
var finished = false

# Called when the node enters the scene tree for the first time.
func start():
	if (dialogue_index > 10):
		dialogue_index = 0
	show()
	load_dialogue()

#func start_dialogue():
	#load_dialogue()
	
func load_dialogue():
	
	if dialogue_index < mc_dialogue.size():
		print(dialogue_index)
		print(mc_dialogue[dialogue_index])
		$TextMC.bbcode_text = mc_dialogue[dialogue_index]
		$TextMC.percent_visible = 0
		$Tween.interpolate_property($TextMC, "percent_visible", 0, 1, 0.8, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		print("dialogue loaded!")
		
	else:
		get_node("../../../../PlayerBody").accept_input = true
		hide()
		#queue_free()
	
	dialogue_index = dialogue_index + 1
	
	
	
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		load_dialogue()

