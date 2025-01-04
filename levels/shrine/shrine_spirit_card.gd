extends Control
class_name ShrineSpiritCard

@onready var spirit_name_label = $CardBG/LabelBG/SpiritNameLabel
var spirit_data # Extends Resource


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func with_data(spirit_data_) -> ShrineSpiritCard:
	spirit_data = spirit_data_
	return self