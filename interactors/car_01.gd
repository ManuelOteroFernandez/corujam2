extends PathFollow2D

const speed = 200

var stop = false
var stop_in_next_loop = false


func set_stop_in_next_loop():
	stop_in_next_loop = true


func _process(delta: float) -> void:
	if stop:
		return
		
	progress += speed * delta
	if stop_in_next_loop:
		if loop and progress_ratio < 0.01:
			h_offset = 0
			loop = false
		if not loop and progress_ratio > 0.52:
			stop = true
			progress_ratio = 0.52
