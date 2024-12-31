extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the game resolution
	DisplayServer.window_set_size(Vector2i(1920, 1080))  # Width x Height
	
	# Optional: Center the window on the screen
	DisplayServer.window_set_position(Vector2i(100, 100))  # Adjust as needed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
