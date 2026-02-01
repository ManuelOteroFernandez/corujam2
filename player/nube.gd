class_name Nube extends CharacterBody2D

signal change_power_signal(power:Powers)
signal active_power_signal(power:Powers)

enum Powers {
	TORMENTA = 0,
	INUNDADO = 1,
	FRIO = 2,
	SECO = 3
}

const POWER_SEQUENSE = {
	Powers.TORMENTA: Powers.INUNDADO,
	Powers.INUNDADO: Powers.FRIO,
	Powers.FRIO: Powers.SECO,
	Powers.SECO: Powers.TORMENTA,
}

const SPEED = 300.0

@onready var timer: Timer = $Timer

var current_power = Powers.SECO

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("power_01"):
		change_power(Powers.TORMENTA)
	elif event.is_action_pressed("power_02"):
		change_power(Powers.INUNDADO)
	elif event.is_action_pressed("power_03"):
		change_power(Powers.FRIO)
	elif event.is_action_pressed("power_04"):
		change_power(Powers.SECO)

func _physics_process(_delta: float) -> void:

	var direction_x := Input.get_axis("move_left", "move_right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var direction_y := Input.get_axis("move_up", "move_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if velocity == Vector2.ZERO:
		if timer.is_stopped():
			timer.start()
	else:
		timer.stop()

	move_and_slide()

func change_power(power:Powers):
	timer.stop()
	current_power = power
	change_power_signal.emit(current_power)
	
func get_radius():
	return $CollisionShape2D.shape.radius
	
func get_influents_points():
	var rad = get_radius()
	return [
		global_position + Vector2.UP * rad,
		global_position + Vector2.DOWN * rad,
		global_position + Vector2.LEFT * rad,
		global_position + Vector2.RIGHT * rad,
	]


func _on_timer_timeout() -> void:
	active_power_signal.emit(current_power)
