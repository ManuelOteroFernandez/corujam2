extends Node2D

@onready var npc_path: NpcPath = $NPC_path

var checkpoint_progress = 0

var manolo:Manolo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	manolo = npc_path.get_manolo()
	
	manolo.manolo_checkpoint_signal.connect(on_manolo_checkpoint)
	manolo.manolo_dead_signal.connect(on_manolo_dead)
	manolo.manolo_win_signal.connect(on_manolo_win)


func on_manolo_win():
	pass


func on_manolo_dead(text:String):
	npc_path.stop()
	npc_path.set_progress(checkpoint_progress)
	
	
func on_manolo_checkpoint(progress:float):
	checkpoint_progress = progress
