extends Node2D

onready var blackout_animator:AnimationPlayer = $BlackOut/AnimationPlayer
export var can_blackout := true

func _ready() -> void:
	Events.connect("half_room_selected", self, "disable_blackout")
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
