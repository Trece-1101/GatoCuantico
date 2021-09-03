class_name LevelResult
extends Node2D

var win:bool

func set_result(win_result:bool, pos:Vector2) -> void:
	var dif_x := pos.x - 1056.0
	global_position = Vector2(1056.0, 432.0)
	win = win_result
	if win_result:
		$Container/Label.text = "SCHODI\nVIVE"
		$Button.text = "Proximo Nivel"
		$Container/SpriteAlive.visible = true
	else:
		$Container/Label.text = "SCHODI\nESTA MUERTO"
		$Button.text = "Reintentar Nivel"
		$Container/SpriteDead.visible = true
	
	visible = true


func _on_Button_pressed() -> void:
	if win:
		Events.emit_signal("change_level")
		return
	
	get_tree().reload_current_scene()


func _on_ButtonMenu_pressed() -> void:
	pass # Replace with function body.
