extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var x_pos = 1
var y_pos = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():
	set_cell(x_pos, y_pos, 0, false, y_pos % 2)
	x_pos += 1
	y_pos += 1
