extends Node2D

@onready var ability_scene = preload("res://spirit/ability/ability.tscn")
const uuid_util = preload('res://uuid.gd')


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(10):
		print("Random: ", randf())
	GameSignals.sandbox_triggered.emit(self)
	print(uuid_util.v4())

	# _test_abilities()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _test_abilities() -> void:
	var abilities = Util.get_any_abilities(3)
	for ability_data in abilities:
		print("Ability data: ", ability_data)
		var ability = ability_scene.instantiate()
		add_child(ability)
		ability.update_ability_data(ability_data)