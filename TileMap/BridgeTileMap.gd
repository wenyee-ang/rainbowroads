extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_bridge = 0

#Corresponds the id of a tile to sides it connects. N:0, E:1, S:2, W:3
const bridge_ids = {
	0: [3,1],		#horizontal
	1: [0,2],		#vertical
	2: [1,2],
	3: [3,2],
	4: [3,0],
	5: [0,1]
}

const direction_vectors = {
	0: Vector2(0,-1),
	1: Vector2(1,0),
	2: Vector2(0,1),
	3: Vector2(-1,0)
}

const direction_translate = {
	'up': 0,
	'right': 1,
	'down': 2,
	'left': 3
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
#	_check_path()

#func _check_path():
#	if path_from(Vector2(1,1), Vector2(6,4)):
#		get_node("Label").text = "Path exists from 1,1 to 6,4"
#	else:
#		get_node("Label").text = "No path from 1,1 to 6,4."

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func place_tile(player_pos, direction):
	print(player_pos, get_node("..").position)
	var new_pos = player_pos - get_node("..").position
	new_pos = new_pos + Vector2(0,48)
	var player_cell = world_to_map(new_pos)
	var target_cell
	
	if get_cellv(player_cell) == -1:
		target_cell = player_cell
	else:
		target_cell = player_cell + direction_vectors[direction_translate[direction]]
	
	set_cellv(target_cell, current_bridge)
	

func _path_from(from, to, direction_arrived):
	
	if from == to:
		return true
	
	var joined = _bridge_joined_sides(from)
	
	var connected = false
	
	#does not currently support t junctions, change return to another var
	
	for side in joined:
		if side == direction_arrived:
			continue
		var new_pos = from + direction_vectors[side]
		if get_cellv(new_pos) != -1:
			connected = true
			return _path_from(new_pos, to, (side + 2) % 4)
	
	return connected

func path_from(from, to):
	return _path_from(from, to, -1)	
	

#func _on_Button_pressed():
#	var cells = get_used_cells()
#	for cell in cells:
#		var id = get_cellv(cell)
#		if id >= 0:
#
#			set_cellv(cell, (id + 3) % 6)
#		#set_cellv(cell, bend_id,
#
#	_check_path()	



func _bridge_joined_sides(pos):
	var tile_id = get_cellv(pos)
	
#	if tile_id == bend_id:
#		var joined = bridge_ids[bend_id]
#
#		if is_cell_x_flipped(pos.x, pos.y):
#			for side in range(0, joined.size()):
#				if joined[side] % 2 == 1:
#					joined[side] = (joined[side] + 2) % 4
#
#		if is_cell_y_flipped(pos.x, pos.y):
#			for side in range(0, joined.size()):
#				if joined[side] % 2 == 0:
#					joined[side] = (joined[side] + 2) % 4
#
#		return joined
			
	
	return bridge_ids[tile_id]
	



func _select_bridge(piece):
	current_bridge = piece
