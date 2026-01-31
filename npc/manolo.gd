extends Area2D

signal manolo_dead_signal(text:String)
signal manolo_win_signal

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("damage"):
		manolo_dead_signal.emit(area.death_text)
	elif area.is_in_group("win"):
		manolo_win_signal.emit()
