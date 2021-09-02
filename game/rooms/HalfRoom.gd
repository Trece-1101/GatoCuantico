extends Node2D

onready var blackout_animator:AnimationPlayer = $BlackOut/AnimationPlayer
export var can_blackout := true

func _ready() -> void:
	Events.connect("player_in_portal", self, "_on_player_in_portal")
	Events.connect("prepare_other_half_room", self, "_on_check_myself")
	get_node("Door").set_is_enable(true)

func disable_blackout() -> void:
	can_blackout = false

func dim_in() -> void:
	if not can_blackout:
		return
	blackout_animator.play("dim_in")

func dim_out() -> void:
	if not can_blackout:
		return
	blackout_animator.play_backwards("dim_in")

func give_black_out() -> void:
	if not can_blackout:
		return
	can_blackout = false
	blackout_animator.play("fade_in")
	get_node("Door").set_is_enable(false)

func _on_player_in_portal() -> void:
	blackout_animator.play_backwards("dim_in")

func _on_check_myself(other_name:String) -> void:
	if other_name != name:
		disable_blackout()
