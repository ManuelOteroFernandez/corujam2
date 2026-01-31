class_name Nube extends CharacterBody2D

signal change_power_signal(power:Powers)

enum Powers {
	TORMENTA = 0,
	INUNDADO = 1,
	MOJADO = 2,
	SECO = 3
}

const POWER_SEQUENSE = {
	Powers.TORMENTA: Powers.INUNDADO,
	Powers.INUNDADO: Powers.MOJADO,
	Powers.MOJADO: Powers.SECO,
	Powers.SECO: Powers.TORMENTA,
}


const SPEED = 300.0
var current_power = Powers.SECO

func _input(event: InputEvent) -> void:
	if event.is_action("interact"):
		change_next_power()

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


	move_and_slide()

func change_next_power():
	current_power = POWER_SEQUENSE[current_power]
	change_power_signal.emit(current_power)
