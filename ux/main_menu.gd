extends CanvasLayer

@onready var transition_screen = $TransitionScreen

func _on_btn_play_pressed() -> void:
	
	transition_screen.fade_out()
	await transition_screen.end_transition_signal
	
	get_tree().change_scene_to_file("res://testing_level.tscn")
	


func _on_btn_credits_pressed() -> void:
	
	get_tree().change_scene_to_file("res://ux/credits_menu.tscn")


func _on_btn_quit_pressed() -> void:
	get_tree().quit()
