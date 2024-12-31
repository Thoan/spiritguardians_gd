extends Node2D


# Cache references to child nodes for easy access
@onready var ability_sprite = $AbilitySprite
# ability_sprite.textu
@onready var current_charge_progress_bar = $AbilityChargeProgressBar
@onready var current_charge_rich_text_label = $CurrentChargeContainer/CurrentChargeCenterContainer/CurrentChargeRichTextLabel
@onready var max_charge_rich_text_label = $MaxChargeContainer/MaxChargeCenterContainer/MaxChargeContainerRichTextLabel

var rich_text_bbcode_styles = {
	"font_size": 24,
	"b": true,
	"wave": true
}

var ability_ready = false
var max_charge: int = 3	
var current_charge: int = 3
var starting_charge: int = 0
var current_charge_progress: float = 0.0
var spirit_id: String = "spirit_id"
var texture = preload("res://assets/special/fire_bolt.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_labels()
	GameSignals.spirit_attacked.connect(_on_spirit_attacked)
	_update_charge_labels()
	_init_progress_bar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_update_progress_bar(delta)


# Print ability information
func print_ability_info() -> void:
	print("Charge: ", current_charge, "/", max_charge)
	print("Ability ready: ", ability_ready)


# Set starting charge and max charge
func _update_charge_labels() -> void:
	current_charge_rich_text_label.text = _get_text_with_bbcode_properties(str(current_charge))
	max_charge_rich_text_label.text = _get_text_with_bbcode_properties(str(max_charge))
	# print_ability_info()


# Sets all charge values
func _set_charge_values(ability_data: Dictionary) -> void:
	self.starting_charge = ability_data["starting_charge"]
	self.current_charge = ability_data["current_charge"]
	self.max_charge = ability_data["max_charge"]
	_update_charge_labels()
	# print_ability_info()


# Called by parent to update ability data
func update_ability_data(ability_data: Dictionary) -> void:
	_set_charge_values(ability_data)
	_update_sprite()
	_update_ability_texture(ability_data["texture"])
	# print_ability_info()


# Called by any to fix sprite
func _update_sprite() -> void:
	if current_charge == max_charge:
		ability_ready = true
		ability_sprite.modulate = Color(1.5, 1.5, 1.5, 1)
	elif current_charge > max_charge:
		current_charge = 0
		ability_ready = false
		ability_sprite.modulate = Color(1, 1, 1, 1)
	else:
		ability_ready = false
		ability_sprite.modulate = Color(1, 1, 1, 1)
	_update_charge_labels()


# Sets ability texture
func _update_ability_texture(new_texture: String) -> void:
	ability_sprite.texture = load(new_texture)


# Called by parent spirit to set id
func set_spirit_id(parent_spirit_id: String) -> void:
	spirit_id = parent_spirit_id


# Called by parent(s) to charge ability
func _charge_ability() -> void:
	if current_charge < max_charge:
		current_charge += 1
		# print_ability_info()
	else:
		current_charge = 0
		# print_ability_info()


# Connects to spirit_attacked signal
func _on_spirit_attacked(parent_spirit_id: String) -> void:

	if parent_spirit_id == spirit_id:
		_charge_ability()
		_update_sprite()
		# _update_progress_bar()


# Initialize progress bar
func _init_progress_bar() -> void:
	current_charge_progress_bar.value = (float(current_charge) / float(max_charge) * 100)


# Updates progress bar to current_charge/max_charge ratio based on delta
func _update_progress_bar(delta: float) -> void:
	var target_progress = (float(current_charge) / float(max_charge) * 100)
	if target_progress == 0:
		current_charge_progress = 0
		current_charge_progress_bar.value = current_charge_progress
	else:
		if target_progress == 100:
			target_progress = 105
		current_charge_progress = current_charge_progress_bar.value
		var progress_diff = target_progress - current_charge_progress
		var progress_speed = (progress_diff/0.15) * delta
		current_charge_progress += progress_speed

	current_charge_progress_bar.value = current_charge_progress
	

# Initialize labels
func _init_labels() -> void:
	current_charge_rich_text_label.bbcode_enabled = true
	max_charge_rich_text_label.bbcode_enabled = true
	# print_ability_info()


# Get label bbcode properties
func _get_label_bbcode_properties() -> Dictionary:
	var bbcode_properties = {
		"prefix": "",
		"suffix": ""
	}
	var prefix_list = []
	var suffix_list = []
	for key in rich_text_bbcode_styles.keys():
		if typeof(rich_text_bbcode_styles[key]) == TYPE_BOOL:
			prefix_list.append( "[" + key + "]")
			suffix_list.append("[/" + key + "]")
		else:
			prefix_list.append("[" + key + "=" + str(rich_text_bbcode_styles[key]) + "]")
			suffix_list.append("[/" + key + "]")
	
	bbcode_properties["prefix"] = "".join(prefix_list)
	suffix_list.reverse()
	bbcode_properties["suffix"] = "".join(suffix_list)
	
	return bbcode_properties


# Get text with bbcode properties
func _get_text_with_bbcode_properties(text: String) -> String:
	var text_label_properties = _get_label_bbcode_properties()
	var prefix = text_label_properties["prefix"]
	var suffix = text_label_properties["suffix"]
	return prefix + text + suffix