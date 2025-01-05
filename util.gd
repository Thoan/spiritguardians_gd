extends Node

const uuid_util = preload('res://uuid.gd')

func hello() -> void:
	print("hello, world")

func get_any_spirit() -> Spirit:
	var spirit: Spirit = Spirit.new()
	spirit.name = get_any_name()
	spirit.description = get_any_description()
	spirit.attack = get_any_attack()
	spirit.type = get_any_spirit_type()
	spirit.element = get_any_element()
	spirit.specials = get_any_spirit_specials(3)
	spirit.image = null
	spirit.id = uuid_util.v4()

	return spirit

func get_any_spirits(count: int) -> Array:
	var spirits = []
	for i in range(count):
		var spirit = get_any_spirit()
		spirits.append(spirit)
	
	return spirits

func get_any_attack_speed() -> float:
	var base_attack_speed = 1.0
	var random_offset = randf_range(-0.5, 0.5)
	var attack_speed = base_attack_speed + random_offset
	return attack_speed

func get_any_spirit_type() -> String:
	var spirit_animal = Enum.Type.keys().pick_random()
	return spirit_animal

func get_any_element() -> String:
	var spirit_element = Enum.Element.keys().pick_random()
	return spirit_element

func get_any_spirit_special() -> Dictionary:
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

func get_any_spirit_specials(number_of_abilities: int) -> Array[SpiritSpecial]:
	var abilities: Array[SpiritSpecial] = []
	for i in range(number_of_abilities):
		var ability = get_any_spirit_special()
		abilities.append(ability)
	
	return abilities

func get_any_attack() -> SpiritAttack:
	var attack_speed = get_any_attack_speed()
	var attack = SpiritAttack.new()
	attack.damage = randi_range(4, 6) + int(3/attack_speed)
	attack.attack_speed = attack_speed
	attack.crit_chance = randf_range(0.2, 0.7)
	attack.crit_multiplier = 2.0
	return attack

func get_any_name() -> String:
	var spirit_first_name = GameSettings.SpiritNameFlavor.pick_random()
	var spirit_last_name = GameSettings.SpiritNameFlavor.pick_random()
	var spirit_name = spirit_first_name + " " + spirit_last_name
	return spirit_name

func get_any_description() -> String:
	var description = GameSettings.DescriptionFlavor.pick_random()
	return description

# Called to get ability center container and configure it with:
func get_a_center_container(min_x: int, min_y: int = 0) -> CenterContainer:
	var center_container = CenterContainer.new()
	center_container.custom_minimum_size = Vector2(min_x, min_y)
	center_container.layout_mode = 2
	return center_container
