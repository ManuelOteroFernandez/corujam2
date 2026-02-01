extends "res://interactors/interactor_base.gd".InteractorBase
@onready var semaforo: Sprite2D = $semaforo
@onready var path_2d: Path2D = $Path2D

func on_active_nube_interact(power:Nube.Powers):
	if power == Nube.Powers.TORMENTA:
		semaforo.active(true)
		for child in path_2d.get_children():
			child.set_stop_in_next_loop()
	
func on_nube_interact(power:Nube.Powers):
	pass
	
func is_manolo_alive(manolo_pos:Vector2):
	return false
	
func get_death_text():
	return "manolo fue atropellado"
