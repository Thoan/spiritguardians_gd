extends Node2D

@onready var shrine_scene = preload("res://levels/shrine/shrine.tscn")
@onready var shrine_instance = shrine_scene.instantiate()
@onready var world = $World

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	world.add_child(shrine_instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Called to switch scenes by removing the current scene and adding the new scene
func switch_scene(new_scene: PackedScene) -> void:
	world.remove_child(world.get_child(0))
	world.add_child(new_scene.instantiate())