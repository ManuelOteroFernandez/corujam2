extends ProgressBar

@onready var timer: Timer = $"../Timer"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = value > 0
	if timer.is_stopped():
		value = 0
		return
		
	
	value = (timer.wait_time - timer.time_left) / timer.wait_time 
