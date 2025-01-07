extends Node

var current_spirit: Spirit = null

func set_current_spirit(spirit: Spirit) -> void:
	print("Setting current spirit: " + spirit.name)
	current_spirit = spirit