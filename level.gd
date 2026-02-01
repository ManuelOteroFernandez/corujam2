extends Node2D

@onready var npc_path: NpcPath = $NPC_path
@onready var death_screen: DeathScreen = $DeathScreen

var checkpoint_progress = 0

var manolo:Manolo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	manolo = npc_path.get_manolo()
	
	manolo.manolo_checkpoint_signal.connect(on_manolo_checkpoint)
	manolo.manolo_dead_signal.connect(on_manolo_dead)
	manolo.manolo_win_signal.connect(on_manolo_win)

	death_screen.continue_signal.connect(continue_game)

func continue_game():
	death_screen.hide_screen()
	
	await death_screen.end_hide_signal
	npc_path.run()

func on_manolo_win():
	pass


func on_manolo_dead(text:String):
	if not npc_path.is_running:
		return
		
	npc_path.stop()
	
	death_screen.show_screen(text)
	
	await death_screen.end_show_signal
	
	npc_path.set_progress(checkpoint_progress)
	
	
func on_manolo_checkpoint(progress:float):
	checkpoint_progress = progress
