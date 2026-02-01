extends "res://interactors/interactor_base.gd".InteractorBase

func on_nube_interact(power:Nube.Powers):
	#print("poder activo {0}".format([power]))
	pass

func on_active_nube_interact(_power:Nube.Powers):
	pass
	
func is_manolo_alive(_manolo_pos:Vector2):
	pass
	
func get_death_text():
	return "mori por testeo"
