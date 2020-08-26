extends Control

var scroll_end = false;
var fade_end = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer/Black.hide()

func _on_AnimationPlayer_animation_finished(anim_name):
	scroll_end = true;
	

func _process(delta):
	if (scroll_end == true):
		$AnimationPlayer/Black.show()
		$AnimationPlayer/FadetoBlack.play("Fade To Black")
		#print("true")
	elif (fade_end == true):
		print("finished")
		get_tree().quit();


func _on_FadetoBlack_animation_finished(anim_name):
	print("finished")
	fade_end = true;
	scroll_end = false;
	$AnimationPlayer/FadetoBlack.stop()
