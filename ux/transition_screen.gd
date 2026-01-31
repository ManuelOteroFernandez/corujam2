extends CanvasLayer

signal end_transition_signal

@onready var rect = $ColorRect

func _ready() -> void:
	fade_in()

func fade_in():
	rect.color.a = 1
	var tween = create_tween()
	tween.tween_property(rect,"color:a", 0, 0.5)
	await tween.finished
	
	end_transition_signal.emit()

func fade_out():
	rect.color.a = 0
	var tween = create_tween()
	tween.tween_property(rect,"color:a", 1, 0.5)
	await tween.finished
	
	end_transition_signal.emit()
