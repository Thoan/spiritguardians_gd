extends Node2D

@onready var shrine_scene = preload("res://levels/shrine/shrine.tscn")
@onready var shrine_instance = shrine_scene.instantiate()
@onready var world = $World

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	world.add_child(shrine_instance)
	GameSignals.shrine_spirit_selected.connect(_on_spirit_selected)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Called to switch scenes by removing the current scene and adding the new scene
func switch_scene(new_scene: PackedScene) -> void:
	world.remove_child(world.get_child(0))
	world.add_child(new_scene.instantiate())


# Called when a spirit is selected
func _on_spirit_selected(spirit_data: Spirit) -> void:
	print("Spirit selected: " + spirit_data.type)
	print("- Name: " + spirit_data.name)
	GameData.set_current_spirit(spirit_data)

	print("Game data current spirit: " + GameData.current_spirit.name)
	print("- Type: " + GameData.current_spirit.type)