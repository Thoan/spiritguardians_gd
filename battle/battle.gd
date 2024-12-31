extends Node2D


var tick_grace_period: float = 0.01
var battle_ticks_per_second: int = 2
var battle_time_accumulator: float = 0.0
var battle_overtime: bool = false
var battle_duration_limit: int = 20
var battle_duration: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Battle scene loaded")
	_load_spirits([])
	# load spirits


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# battle_time_accumulator += delta
	# # print("delta: ", battle_time_accumulator)
	# if battle_time_accumulator >= (1.0 / battle_ticks_per_second) - tick_grace_period:
	# 	GameSignals.battle_ticked.emit()
	# 	battle_time_accumulator = 0.0
	# 	battle_duration += 1
	pass

func _load_spirits(spirit_info: Array) -> void:
	print("Loading spirits")
	# load spirits
	print("spirit_info: ", spirit_info)
	print("Spirits loaded")
