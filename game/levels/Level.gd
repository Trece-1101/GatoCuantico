extends Node

export(String, FILE, "*.tscn") var next_level = ""
export var auto_enable_player := false
export var result_panel:PackedScene = null

var schodi_dead := false

onready var camera_animations := $CameraLevel/AnimationPlayer

func _ready() -> void:
	if GameMusic.get_music_playing() != "level":
		GameMusic.play_music("level")
	connect_signals()
	camera_animations.play_backwards("fade_in")

func connect_signals() -> void:
	Events.connect("change_level", self, "_on_change_level")
	Events.connect("player_in_portal", self, "_on_player_in_portal")
	Events.connect("time_out", self, "_on_time_out")
	Events.connect("player_dead", self, "_on_player_dead")
	camera_animations.connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")

func _on_change_level() -> void:
	get_tree().change_scene(next_level)

func _on_player_in_portal() -> void:
	var pos := GameData.get_non_observable_player().global_position
	create_result_panel(not schodi_dead, pos)

func create_result_panel(win:bool, pos:Vector2) -> void:
	var new_result_panel:LevelResult = result_panel.instance()
	new_result_panel.set_result(win, pos)
	add_child(new_result_panel)

func _on_time_out() -> void:
	randomize()
	if randf() < 0.5:
		$HalfRoomBlue.give_black_out()
		$HalfRoomRed.disable_blackout()
	else:
		$HalfRoomRed.give_black_out()
		$HalfRoomBlue.disable_blackout()

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_in" and auto_enable_player:
		Events.emit_signal("enable_player")

func _on_player_dead(obs_player:bool) -> void:
	if obs_player:
		var pos := GameData.get_observable_player().global_position
		create_result_panel(false, pos)
	
	schodi_dead = true
