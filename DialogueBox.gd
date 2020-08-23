extends Control


var start_dialogue = [
	"...A teddy bear?", 
	"How did this get here?",
	"Did you get blown over here by that freak pancake storm last night, lil' guy?",
	".........",
	"There's a name here. I suppose your owner must really be missing you.",
	"The bridges were all destroyed by that storm though...",
	"It's way too much work to get you home.",
	"..........",
	"...................................",
	"................................................................................................................................................................",
	"Ah damn it."
]

var dialogue_index = 0
var finished = false

# Called when the node enters the scene tree for the first time.
#func _ready():
	#load_dialogue()
	

func load_dialogue():
	
	if dialogue_index < start_dialogue.size():
		$Text1.bbcode_text = start_dialogue[dialogue_index]
		$Text1.percent_visible = 0
		$Tween.interpolate_property($Text1, "percent_visible", 0, 1, 0.8, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		queue_free()
	dialogue_index += 1
	
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	load_dialogue()
	if Input.is_action_just_released("ui_accept"):
		load_dialogue()
