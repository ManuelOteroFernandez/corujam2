extends CanvasLayer

@onready var transition_screen = $TransitionScreen

func _on_btn_play_pressed() -> void:
	
	transition_screen.fade_out()
	await transition_screen.end_transition_signal
	
	get_tree().change_scene_to_file("res://testing_level.tscn")
