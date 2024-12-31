extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameSignals.sandbox_triggered.connect(_on_sandbox_triggered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Called when sandbox is triggered
func _on_sandbox_triggered(uuid) -> void:
	print("Sandbox triggered")
	print("uuid", uuid)