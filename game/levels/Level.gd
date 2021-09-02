extends Node

export(String, FILE, "*.tscn") var next_level = ""
export var auto_enable_player := false

onready var camera_animations := $CameraLevel/AnimationPlayer

func _ready() -> void:
	connect_signals()
	camera_animations.play_backwards("fade_in")

func connect_signals() -> void:
	Events.connect("change_level", self, "_on_change_level")
	Events.connect("player_in_portal", self, "_on_player_in_portal")

func _on_change_level() -> void:
	get_tree().change_scene(next_level)

func _on_player_in_portal() -> void:
	print("player en portal")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_in" and auto_enable_player:
		Events.emit_signal("enable_player")
