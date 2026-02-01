extends "res://interactors/interactor_base.gd".InteractorBase
@onready var tile_map_layer: TileMapLayer = $TileMapLayer

@export var max_times_to_fill = 3

var times = 0

func on_active_nube_interact(power:Nube.Powers):
	if power == Nube.Powers.INUNDADO:
		if times < max_times_to_fill:
			times += 1
			for cell_pos in tile_map_layer.get_used_cells():
				var cell_atlas_pos = tile_map_layer.get_cell_atlas_coords(cell_pos)
				tile_map_layer.set_cell(cell_pos,0,cell_atlas_pos+Vector2i(0,1))
		
func on_nube_interact(_power:Nube.Powers):
	pass
	
func is_manolo_alive(_manolo_pos:Vector2):
	return times == max_times_to_fill
	
func get_death_text():
	return "Se ahogo el manolo"
