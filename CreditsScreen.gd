extends Control

var scroll_end = false;
var fade_end = false;
var sound_out = true;

onready var tween_out = get_node("BackgroundMusic/Tween")
var transition_duration = 6.50
var transition_type = 1 # TRANS_SINE

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer/Black.hide()

func _on_AnimationPlayer_animation_finished(anim_name):
	scroll_end = true;
	

func _process(delta):
	if (scroll_end == true):
		$AnimationPlayer/Black.show()
		$AnimationPlayer/FadetoBlack.play("Fade To Black")
		if (sound_out == true):
			fade_out()
		#print("true")
	elif (fade_end == true):
		print("finished")
		get_tree().quit();


func _on_FadetoBlack_animation_finished(anim_name):
	#print("finished")
	fade_end = true;
	scroll_end = false;
	$AnimationPlayer/FadetoBlack.stop()

func fade_out():
	# tween music volume down to 0
	sound_out = false;
	tween_out.interpolate_property($BackgroundMusic, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween_out.start()
	print("tween started")
	print($BackgroundMusic.volume_db)
	# when the tween ends, the music will be stopped


func _on_Tween_tween_all_completed():
	print("tween completed")
	$BackgroundMusic.stop();
