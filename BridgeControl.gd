extends Control

signal bridge1
signal bridge2
signal bridge3
signal bridge4
signal bridge5
signal bridge6


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if Input.is_action_pressed("ui_one"):
		emit_signal("bridge1")
		print("bridge1")
		
	elif Input.is_action_pressed("ui_two"):
		emit_signal("bridge2")
		print("bridge2")
		
	elif Input.is_action_pressed("ui_three"):
		emit_signal("bridge3")
		print("bridge3")
		
	elif Input.is_action_pressed("ui_four"):
		emit_signal("bridge4")
		print("bridge4")
		
	elif Input.is_action_pressed("ui_five"):
		emit_signal("bridge5")
		print("bridge5")
		
	elif Input.is_action_pressed("ui_six"):
		emit_signal("bridge6")
		print("bridge6")


func _on_Bridge1_pressed():
	emit_signal("bridge1")
	print("bridge1")

func _on_Bridge2_pressed():
	emit_signal("bridge2")
	print("bridge2")

func _on_Bridge3_pressed():
	emit_signal("bridge3")
	print("bridge3")

func _on_Bridge4_pressed():
	emit_signal("bridge4")
	print("bridge4")

func _on_Bridge5_pressed():
	emit_signal("bridge5")
	print("bridge5")

func _on_Bridge6_pressed():
	emit_signal("bridge6")
	print("bridge6")
