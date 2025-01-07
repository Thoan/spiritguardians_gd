extends Node2D

# @onready var old_ability_scene = preload("res://spirit/ability/ability.tscn")
@onready var special_ability_scene = preload("res://spirit/special_ability/special_ability.tscn")
@onready var ability_hbox_container = $AbilityHBoxContainer

var in_battle = true
var spirit_data: Spirit = Util.get_any_spirit()
var spirit_id = spirit_data["id"]
var attack_cooldown_accumulator = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_spirit_abilities()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	attack_cooldown_accumulator += delta
	if attack_cooldown_accumulator >= (1.0 / spirit_data["attack"]["attack_speed"]) - GameConsts.CoolDownEpsilon:
		# print("Spirit attacked for ", spirit_data["attack"]["damage"], " damage!")
		# print("attack_delta_accumulator: ", attack_cooldown_accumulator)
		attack_cooldown_accumulator = 0.0
		GameSignals.spirit_attacked.emit(spirit_id)


# Called when spirit needs all abilities initialized
func _init_spirit_abilities() -> void:
	var spirit_special_ability_data = spirit_data["specials"]
	for special_ability_data in spirit_special_ability_data:
		_init_ability(special_ability_data)


# Called when spirit needs to initialize an ability
func _init_ability(special_ability_data: SpecialAbility) -> void:
	var special_ability_scene_instance = special_ability_scene.instantiate()
	special_ability_scene_instance.set_spirit_id(spirit_id)
	var ability_center_container = _get_ability_center_container()
	ability_center_container.add_child(special_ability_scene_instance)
	ability_hbox_container.add_child(ability_center_container)
	special_ability_scene_instance.update_ability_data(special_ability_data)


# Called to get ability center container and configure it with:
func _get_ability_center_container() -> CenterContainer:
	var ability_center_container = CenterContainer.new()
	ability_center_container.custom_minimum_size = Vector2(128, 0)
	ability_center_container.layout_mode = 2
	return ability_center_container
