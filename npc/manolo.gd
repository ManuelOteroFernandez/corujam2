extends Area2D

signal manolo_dead_signal(text:String)
signal manolo_win_signal

@onready var timer: Timer = $Timer

var damage_area = null

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("damage"):
		start_check_is_alive(area)
	if area.is_in_group("instand_damage"):
		manolo_die(area)
	elif area.is_in_group("win"):
		manolo_win_signal.emit()

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("damage"):
		stop_check_is_alive()
	
func start_check_is_alive(area:Area2D):
	damage_area = area
	timer.start()
	
func stop_check_is_alive():
	timer.stop()
	damage_area = null

func _on_timer_timeout() -> void:
	if damage_area == null:
		return
		
	if damage_area.has_method("is_manolo_alive") and \
	not damage_area.is_manolo_alive(global_position):
		manolo_die(damage_area)
		
func manolo_die(area:Area2D):
		manolo_dead_signal.emit(area.get_death_text())
		queue_free()
