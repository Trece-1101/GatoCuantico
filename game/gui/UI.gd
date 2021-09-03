extends CanvasLayer

export(String, FILE, "*.tscn") var main_menu = ""
export(String, FILE, "*.tscn") var level_selection_menu = ""

func set_level_text(level_name: String) -> void:
	$LevelName.text = level_name

func _ready() -> void:
	$BtnRetry.visible = true
	$BtnMenu.visible = true
	$BtnSelection.visible = true
	$LevelName.visible = true

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("retry"):
		get_tree().reload_current_scene()
	elif event.is_action_pressed("main"):
		get_tree().change_scene("res://game/menus/MainMenu.tscn")
	elif event.is_action_pressed("level_selection"):
		get_tree().change_scene("res://game/menus/LevelSelection.tscn")

func _on_BtnRetry_pressed() -> void:
	GameMusic.play_button()
	get_tree().reload_current_scene()


func _on_BtnMenu_pressed() -> void:
	GameMusic.play_button()
	get_tree().change_scene(main_menu)


func _on_BtnSelection_pressed() -> void:
	GameMusic.play_button()
	get_tree().change_scene(level_selection_menu)
