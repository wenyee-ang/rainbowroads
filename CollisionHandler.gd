extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print($Environment, $BridgeControl)
	for i in range(0,6):
		$BridgeControl.connect("bridge" + str(i+1), $Environment/BridgeTileMap, "_select_bridge", [i])
		
	$Environment/Area2D.connect("body_entered", $PlayerBody, "start_girl_animate")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var adj_pos = $Environment/BridgeTileMap.tile_from_player_pos(
			$PlayerBody.position
		)
	
	var bridge_tile = $Environment/BridgeTileMap.get_cellv(adj_pos)
	
	
	var base_cell = $Environment/BaseTileMap.world_to_map($PlayerBody.position)
	#print(base_cell, $Environment/BaseTileMap.get_cellv(base_cell))
	
	if bridge_tile != -1:
		$Environment/BaseTileMap.set_collision_layer_bit(1,false)
	else: 
		$Environment/BaseTileMap.set_collision_layer_bit(1,true)
		
		if $Environment/BaseTileMap.get_cellv(base_cell) == -1 :
			var closest_bridge = $Environment/BridgeTileMap.closest_bridge_pos(
				$PlayerBody.position
			)
			
			if closest_bridge:
				$PlayerBody.position = closest_bridge
		

func please_help():
	print('hehe')
