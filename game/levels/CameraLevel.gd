extends Camera2D

export var time_left := 60

func _ready() -> void:
	update_time_left_label()
	Events.connect("half_room_selected", self, "destroy_label")

func update_time_left_label() -> void:
	$CanvasLayer/TimeLeft.text = String(time_left)

func _on_Timer_timeout() -> void:
	time_left -= 1
	update_time_left_label()
	if time_left == 0:
		destroy_label()
		Events.emit_signal("time_out")

func destroy_label() -> void:
	$Timer.stop()
	$CanvasLayer/TimeLeft.visible = false
