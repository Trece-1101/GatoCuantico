extends Area2D


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("seleccionar"):
		owner.give_black_out()


func _on_mouse_entered() -> void:
	owner.dim_in()


func _on_mouse_exited() -> void:
	owner.dim_out()
