extends Area2D


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("seleccionar"):
		owner.give_black_out()
		Events.emit_signal("prepare_other_half_room", owner.name)
		var selectors := get_tree().get_nodes_in_group("selection")
		for selector in selectors:
			selector.queue_free()

func _on_mouse_entered() -> void:
	owner.dim_in()


func _on_mouse_exited() -> void:
	owner.dim_out()
