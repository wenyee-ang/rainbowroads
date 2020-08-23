extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bridge_tile = $Environment/BridgeTileMap.get_cellv(
		$Environment/BridgeTileMap.tile_from_player_pos(
			$PlayerBody.position
		)
	)
	
	print($Environment/BaseTileMap)
	
	if bridge_tile != -1:
		$Environment/BaseTileMap.set_collision_mask_bit(0,false)
	else: 
		$Environment/BaseTileMap.set_collision_mask_bit(0,true)
