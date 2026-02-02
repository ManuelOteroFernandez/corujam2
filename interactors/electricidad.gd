extends "res://interactors/interactor_base.gd".InteractorBase

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

const KILL_ATLAS_COORD = Vector2i(0,4)
const SECO = Vector2(2,2)

func get_death_text():
	return "manolo murio eletrocutado"
	
func is_manolo_alive(manolo_pos:Vector2):
	var local_pos = to_local(manolo_pos)
	var coord = tile_map_layer.local_to_map(local_pos)
	var kill_atlas_coord = tile_map_layer.get_cell_atlas_coords(coord)
	
	return kill_atlas_coord != KILL_ATLAS_COORD
	
func on_active_nube_interact(power:Nube.Powers):
	if power == Nube.Powers.SECO:
		secar()

func on_nube_interact(power:Nube.Powers):
	pass
	

func secar():
	var nube_global_pos_list = nube.get_influents_points()
	for ngp in nube_global_pos_list:
		var nube_local_pos = to_local(ngp)
		
		var coord = tile_map_layer.local_to_map(nube_local_pos)
		if tile_map_layer.get_cell_source_id(coord) != -1:
			tile_map_layer.set_cell(coord,0,SECO)
