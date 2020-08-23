extends Control

func _ready():
	$LineHowtoPlay.hide()
	$LineStart.hide()

func _on_Start_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Start_mouse_entered():
	$Buttons/Select.play()
	$LineStart.show()


func _on_Start_mouse_exited():
	$LineStart.hide()

func _on_HowToPlay_mouse_entered():
	$Buttons/Select.play()
	$LineHowtoPlay.show()


func _on_HowToPlay_mouse_exited():
	$LineHowtoPlay.hide()


func _on_HowToPlay_pressed():
	pass # Replace with function body.
