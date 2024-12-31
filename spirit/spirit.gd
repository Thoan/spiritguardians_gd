extends Node2D

@onready var ability_scene = preload("res://spirit/ability/ability.tscn")
@onready var ability_hbox_container = $AbilityHBoxContainer

var in_battle = true
var spirit_data = Util.any_spirit()
var spirit_id = spirit_data["id"]
var attack_cooldown_accumulator = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Spirit card _ready")
	print(spirit_data)
	_init_spirit_abilities()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	attack_cooldown_accumulator += delta
	if attack_cooldown_accumulator >= (1.0 / spirit_data["attack"]["attack_speed"]) - GameSettings.CoolDownEpsilon:
		# print("Spirit attacked for ", spirit_data["attack"]["damage"], " damage!")
		# print("attack_delta_accumulator: ", attack_cooldown_accumulator)
		attack_cooldown_accumulator = 0.0
		GameSignals.spirit_attacked.emit(spirit_id)


# Called when spirit needs all abilities initialized
func _init_spirit_abilities() -> void:
	var spirit_ability_data = spirit_data["abilities"]
	for ability_data in spirit_ability_data:
		_init_ability(ability_data)


# Called when spirit needs to initialize an ability
func _init_ability(ability_data: Dictionary) -> void:
	var ability = ability_scene.instantiate()
	ability.set_spirit_id(spirit_id)
	var ability_center_container = _get_ability_center_container()
	ability_center_container.add_child(ability)
	ability_hbox_container.add_child(ability_center_container)
	ability.update_ability_data(ability_data)


# Called to get ability center container and configure it with:
func _get_ability_center_container() -> CenterContainer:
	var ability_center_container = CenterContainer.new()
	ability_center_container.custom_minimum_size = Vector2(128, 0)
	ability_center_container.layout_mode = 2
	return ability_center_container
