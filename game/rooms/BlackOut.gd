class_name BlackOut
extends Sprite


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_in":
		Events.emit_signal("half_room_selected")
