extends CanvasLayer

@export var npc_path: NpcPath
@export var text_list: Array[String]

@onready var text: RichTextLabel = $Control/NinePatchRect/RichTextLabel
@onready var control: Control = $Control
@onready var timer: Timer = $Timer

func _ready() -> void:
	npc_path.manolo_stop_signal.connect(on_manolo_stop)

func on_manolo_stop():
	show_message()
	
func show_message():
	text.text = text_list.pick_random()
	var tw = create_tween()
	tw.tween_property(control,"modulate:a",1,1)
	
	timer.start()

func hide_message():
	var tw = create_tween()
	tw.tween_property(control,"modulate:a",0,1)
	npc_path.run()
