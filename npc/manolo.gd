extends Area2D

signal manolo_dead_signal(text:String)
signal manolo_win_signal

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("is_manolo_alive") and \
	area.is_manolo_alive(global_position):
		manolo_dead_signal.emit(area.get_death_text)
		queue_free()
	elif area.is_in_group("win"):
		manolo_win_signal.emit()
