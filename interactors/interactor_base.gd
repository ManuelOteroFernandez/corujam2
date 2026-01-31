@abstract
class InteractorBase extends Area2D:
 
	var nube:Nube

	func _ready() -> void:
		body_entered.connect(_on_body_entered)
		body_exited.connect(_on_body_exited)

	func _on_body_entered(body: Node2D) -> void:
		print("dentro")
		if not body is Nube:
			return

		nube = body as Nube
		nube.change_power_signal.connect(on_nube_interact)
		nube.active_power_signal.connect(on_active_nube_interact)
		
		on_nube_interact(nube.current_power)


	func _on_body_exited(body: Node2D) -> void:
		print("fuera")
		if not body is Nube:
			return
		
		var nube_out = body as Nube
		nube_out.change_power_signal.disconnect(on_nube_interact)
		nube_out.active_power_signal.disconnect(on_active_nube_interact)
		
		nube = null

	@abstract
	func on_nube_interact(power:Nube.Powers)
	
	@abstract
	func on_active_nube_interact(power:Nube.Powers)
	
	@abstract
	func is_manolo_alive(manolo_pos:Vector2)
	
	@abstract
	func get_death_text()
