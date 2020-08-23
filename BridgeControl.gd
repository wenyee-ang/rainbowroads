extends Control

signal bridge1
signal bridge2
signal bridge3
signal bridge4
signal bridge5
signal bridge6

var path = "CanvasLayer/Borders/Container"

func _ready():
	$CanvasLayer/Borders/Container1.hide()
	$CanvasLayer/Borders/Container2.hide()
	$CanvasLayer/Borders/Container3.hide()
	$CanvasLayer/Borders/Container4.hide()
	$CanvasLayer/Borders/Container5.hide()
	$CanvasLayer/Borders/Container6.hide()
	$CanvasLayer/Dialogue.hide()
	
	connect("bridge1", self, "make_visible", ["1"])
	connect("bridge2", self, "make_visible", ["2"])
	connect("bridge3", self, "make_visible", ["3"])
	connect("bridge4", self, "make_visible", ["4"])
	connect("bridge5", self, "make_visible", ["5"])
	connect("bridge6", self, "make_visible", ["6"])
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if Input.is_action_pressed("ui_one"):
		make_hidden()
		emit_signal("bridge1")
		print("bridge1")
		
	elif Input.is_action_pressed("ui_two"):
		make_hidden()
		emit_signal("bridge2")
		print("bridge2")

	elif Input.is_action_pressed("ui_three"):
		make_hidden()
		emit_signal("bridge3")
		print("bridge3")
		
	elif Input.is_action_pressed("ui_four"):
		make_hidden()
		emit_signal("bridge4")
		print("bridge4")
		
	elif Input.is_action_pressed("ui_five"):
		make_hidden()
		emit_signal("bridge5")
		print("bridge5")
		
	elif Input.is_action_pressed("ui_six"):
		make_hidden()
		emit_signal("bridge6")
		print("bridge6")
		


func _on_Bridge1_pressed():
	make_hidden()
	emit_signal("bridge1")
	print("bridge1")

func _on_Bridge2_pressed():
	make_hidden()
	emit_signal("bridge2")
	print("bridge2")

func _on_Bridge3_pressed():
	make_hidden()
	emit_signal("bridge3")
	print("bridge3")

func _on_Bridge4_pressed():
	make_hidden()
	emit_signal("bridge4")
	print("bridge4")

func _on_Bridge5_pressed():
	make_hidden()
	emit_signal("bridge5")
	print("bridge5")

func _on_Bridge6_pressed():
	make_hidden()
	emit_signal("bridge6")
	print("bridge6")
	
	

func make_visible(num):
	var new_path = path + num
	var node = NodePath(new_path)
	get_node(node).show()
	if not (get_node("../PlayerBody/Select").is_playing()):
		get_node("../PlayerBody/Select").play()
	

func make_hidden():
	for n in range(1,7):
		var new_path = path + str(n)
		var node = NodePath(new_path)
			
		if (get_node(node).is_visible()):
			get_node(node).hide()

func _on_exit_pressed():
	$CanvasLayer/Tutorial.hide()
	if get_node("../PlayerBody").accept_input == false:
		get_node("../PlayerBody").entrance_animate = true

func _on_exit_mouse_entered():
	get_node("../PlayerBody/Select").play()
