extends "res://interactors/interactor_base.gd".InteractorBase

@onready var timer: Timer = $Timer
@onready var path_2d: Path2D = $Path2D
@onready var alcantarilla: Sprite2D = $alcantarilla

func get_death_text():
	return "murio atropellado"
	
func is_manolo_alive(_manolo_pos:Vector2):
	return false
	
func on_active_nube_interact(_power:Nube.Powers):
	pass
	
	
func on_nube_interact(power:Nube.Powers):
	if power == Nube.Powers.INUNDADO:
		start_progress()
	else:
		stop_progress()
	
	
func start_progress():
	timer.start()
	
func stop_progress():
	timer.stop()

func _on_timer_timeout() -> void:
	alcantarilla.active(true)
	for child in path_2d.get_children():
		child.set_stop_in_next_loop()
		
