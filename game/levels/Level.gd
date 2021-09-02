extends Node

export(String, FILE, "*.tscn") var next_level = ""

func _ready() -> void:
	connect_signals()

func connect_signals() -> void:
	Events.connect("change_level", self, "_on_change_level")
	Events.connect("player_in_portal", self, "_on_player_in_portal")

func _on_change_level() -> void:
	get_tree().change_scene(next_level)

func _on_player_in_portal() -> void:
	print("player en portal")
