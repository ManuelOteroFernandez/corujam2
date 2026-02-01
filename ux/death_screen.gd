class_name DeathScreen extends CanvasLayer

signal end_show_signal
signal end_hide_signal
signal continue_signal

@onready var container: Control = $Container
@onready var text: RichTextLabel = $Container/VBoxContainer/RichTextLabel2

func show_screen(text_in:String):
	container.modulate.a = 0
	text.text = text_in
	var tween = create_tween()
	tween.tween_property(container,"modulate:a",1,1)
	
	await tween.finished
	
	end_show_signal.emit()
	

func hide_screen():
	container.modulate.a = 1
	
	var tween = create_tween()
	tween.tween_property(container,"modulate:a",0,1)
	
	await tween.finished
	
	end_hide_signal.emit()
	


func _on_button_pressed() -> void:
	continue_signal.emit()
