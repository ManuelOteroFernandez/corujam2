extends CanvasLayer


func _on_btn_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://ux/main_menu.tscn")
