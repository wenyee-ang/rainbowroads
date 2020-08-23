extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print($Environment, $BridgeControl)
	for i in range(0,6):
		$BridgeControl.connect("bridge" + str(i+1), $Environment/BridgeTileMap, "_select_bridge", [i])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bridge_tile = $Environment/BridgeTileMap.get_cellv(
		$Environment/BridgeTileMap.tile_from_player_pos(
			$PlayerBody.position
		)
	)
	
	print($Environment/BaseTileMap)
	
	if bridge_tile != -1:
		$Environment/BaseTileMap.set_collision_layer_bit(1,false)
	else: 
		$Environment/BaseTileMap.set_collision_layer_bit(1,true)
