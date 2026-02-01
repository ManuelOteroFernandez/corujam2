extends CanvasLayer

@export var text_list:Array[String]
@onready var text: RichTextLabel = $Container/VBoxContainer/RichTextLabel
@onready var timer: Timer = $Timer
@onready var transition_screen: CanvasLayer = $transition_screen

var next_index = 0

func _ready() -> void:
	next_text()
	
func next_text():
	var tw = create_tween()
	tw.tween_property(text,"modulate:a", 0, 0.5)
	
	await tw.finished
	
	text.text = text_list[next_index]
	if next_index < text_list.size():
		next_index += 1
		
	var tw2 = create_tween()
	tw2.tween_property(text,"modulate:a",1,0.5)



func _on_timer_timeout() -> void:
	if next_index < text_list.size():
		next_text()
	else:
		transition_screen.fade_out()
		await transition_screen.end_transition_signal
		
		get_tree().change_scene_to_file("res://LvlOne.tscn")
