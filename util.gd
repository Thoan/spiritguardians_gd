extends Node

const uuid_util = preload('res://uuid.gd')

func hello() -> void:
	print("hello, world")

func any_spirit() -> Dictionary:
	var spirit = {
		"name": any_name(),
		"description": any_description(),
		"attack": any_attack(),
		"animal": any_animal(),
		"element": any_element(),
		"abilities": any_abilities(3),
		"image": null,
		"id": uuid_util.v4()
	}
	return spirit

func any_attack_speed() -> float:
	var base_attack_speed = 1.0
	var random_offset = randf_range(-0.5, 0.5)
	var attack_speed = base_attack_speed + random_offset
	return attack_speed

func any_animal() -> String:
	var spirit_animal = Enum.Animal.keys().pick_random()
	return spirit_animal

func any_element() -> String:
	var spirit_element = Enum.Element.keys().pick_random()
	return spirit_element

func any_ability() -> Dictionary:
	var max_charge = randi_range(3, 7)
	var starting_charge = randi_range(0, max_charge)
	var ability = {
		"starting_charge": randi_range(0, max_charge),
		"current_charge": starting_charge,
		"max_charge": max_charge,
		"damage": max(1, randi_range(1*(max_charge - starting_charge), 10*max_charge)),
		"texture": "res://assets/special/fire_bolt.png"
	}
	return ability

func any_abilities(number_of_abilities: int) -> Array:
	var abilities = []
	for i in range(number_of_abilities):
		var ability = any_ability()
		abilities.append(ability)
	
	return abilities

func any_attack() -> Dictionary:
	var attack_speed = any_attack_speed()
	var attack = {
		"damage": randi_range(4, 6) + int(3/attack_speed),
		"attack_speed": attack_speed,
		"crit_chance": randf_range(0.2, 0.7),
		"crit_multiplier": 2.0
	}
	return attack

func any_name() -> String:
	var spirit_first_name = GameSettings.SpiritNameFlavor.pick_random()
	var spirit_last_name = GameSettings.SpiritNameFlavor.pick_random()
	var spirit_name = spirit_first_name + " " + spirit_last_name
	return spirit_name

func any_description() -> String:
	var description = GameSettings.DescriptionFlavor.pick_random()
	return description

