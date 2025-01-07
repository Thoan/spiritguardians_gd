extends Control
class_name ShrineSpiritCard

@onready var spirit_name_button = $SpiritNameButton
@onready var spirit_name_label = $SpiritNameButton/SpiritNameLabel
var spirit_data: Spirit
var spirit_name: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spirit_name_button.pressed.connect(_on_spirit_name_button_pressed)
	spirit_name_label.append_text(spirit_name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Called to set the spirit data
func with_data(spirit_data_: Spirit) -> ShrineSpiritCard:
	spirit_data = spirit_data_
	spirit_name = get_spirit_name()
	return self


# Called to get the BBCoded spirit animal
func get_spirit_name() -> String:
	# spirit_name_label.push("center")
	# spirit_name_label.push_italics()
	# spirit_name_label.append_text(spirit_data.type)
	# spirit_name_label.pop()  # Ends the tag opened by `push_italics()`.
	# spirit_name_label.pop()  # Ends the tag opened by `push_color()`.
	var color = Color.DARK_CYAN
	var tags = []
	tags.append("[center]")
	tags.append("[wave]")
	tags.append("[b]")
	tags.append("[font_size=60]")
	tags.append("[outline_color=" + color.to_html() + "]")
	tags.append("[outline_size=15]")
	tags.append(spirit_data.type)
	tags.append("[/outline_size]")
	tags.append("[/outline_color]")
	tags.append("[/font_size]")
	tags.append("[/b]")
	tags.append("[/wave]")
	tags.append("[/center]")
	return "".join(tags)


# Called when the spirit name button is pressed
func _on_spirit_name_button_pressed() -> void:
	GameSignals.shrine_spirit_selected.emit(spirit_data)