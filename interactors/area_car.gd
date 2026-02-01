extends Area2D
@onready var carretera: Area2D = $"../../.."


func get_death_text():
	return carretera.get_death_text()
