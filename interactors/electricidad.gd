extends "res://interactors/interactor_base.gd".InteractorBase

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

const KILL_ATLAS_COORD = Vector2i(0,0)
const SECO = Vector2(0,1)

func get_death_text():
	return "manolo murio eletrocutado"
	
func is_manolo_alive(manolo_pos:Vector2):
	return false
	
func on_active_nube_interact(power:Nube.Powers):
	if power == Nube.Powers.FRIO:
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
