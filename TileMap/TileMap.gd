extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const bend_id = 2

#Corresponds the id of a tile to sides it connects. N:0, E:1, S:2, W:3
const bridge_ids = {
	0: [3,1],		#horizontal
	1: [0,2],		#vertical
	bend_id: [1,2]	#bend. additional code needed to handle reflections
}

const direction_vectors = {
	0: Vector2(0,-1),
	1: Vector2(1,0),
	2: Vector2(0,1),
	3: Vector2(-1,0)
}

# Called when the node enters the scene tree for the first time.
func _ready():
	_check_path()

func _check_path():
	if path_from(Vector2(1,1), Vector2(6,4)):
		get_node("Label").text = "Path exists from 1,1 to 6,4"
	else:
		get_node("Label").text = "No path from 1,1 to 6,4."

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
	

func _on_Button_pressed():
	var cells = get_used_cells_by_id(bend_id)
	for cell in cells:
		set_cellv(cell, bend_id,
			is_cell_x_flipped(cell.x,cell.y), 
			!is_cell_y_flipped(cell.x, cell.y))
	
	_check_path()	



func _bridge_joined_sides(pos):
	var tile_id = get_cellv(pos)
	
	if tile_id == bend_id:
		var joined = bridge_ids[bend_id]
		
		if is_cell_x_flipped(pos.x, pos.y):
			for side in range(0, joined.size()):
				if joined[side] % 2 == 1:
					joined[side] = (joined[side] + 2) % 4
					
		if is_cell_y_flipped(pos.x, pos.y):
			for side in range(0, joined.size()):
				if joined[side] % 2 == 0:
					joined[side] = (joined[side] + 2) % 4
					
		return joined
			
	
	return bridge_ids[tile_id]
	
