extends Node

@onready var spirit_card_scene = preload("res://levels/shrine/shrine_spirit_card.tscn")
@onready var hbox_container = $HBoxContainer

const SPIRIT_CHOICE_COUNT = 3
var spirit_choices: Array[Spirit] = []
var spirit_cards: Array = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(SPIRIT_CHOICE_COUNT):
		var spirit_data: Spirit = Util.get_any_spirit()
		print(spirit_data.type)
		spirit_choices.append(spirit_data)
	render_spirit_choices()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Called to render spirit choices to the screen
func render_spirit_choices() -> void:
	for i in range(SPIRIT_CHOICE_COUNT):
		var spirit_data: Spirit = spirit_choices[i]
		var spirit_card = spirit_card_scene.instantiate().with_data(spirit_data)
		spirit_cards.append(spirit_card)
		hbox_container.add_child(spirit_card)
