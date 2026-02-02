class_name NpcPath extends Path2D

signal manolo_stop_signal

@export var stop_points: Array[float] = []
@export var speed = 100

@onready var follow = $PathFollow2D
@onready var manolo: Area2D = $PathFollow2D/Manolo

var current_goal = 0
var is_running = false

func run():
	is_running = true
	
func stop():
	manolo_stop_signal.emit()
	is_running = false
	if current_goal < stop_points.size() - 1:
		current_goal += 1 

func stop_by_death():
	is_running = false

func _process(delta: float) -> void:
	if not is_running:
		return
	
	if follow.progress < stop_points[current_goal]:
		follow.progress += speed * delta
	
	else:
		stop()

	
func get_manolo():
	return manolo
	
func set_progress(progress:float):
	follow.progress = progress
