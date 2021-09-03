extends Node2D


func set_result(win:bool, pos:Vector2) -> void:
	if win:
		$Container/Label.text = "SCHODI\nVIVE"
		$Button.text = "Proximo Nivel"
		$Container/SpriteAlive.visible = true
	else:
		$Container/Label.text = "SCHODI\nESTA MUERTO"
		$Button.text = "Reintentar Nivel"
		$Container/SpriteDead.visible = true
	
	visible = true
