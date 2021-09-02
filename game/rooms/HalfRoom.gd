extends Node2D

var blackout = preload("res://game/rooms/BlackOut.tscn").instance()

func give_black_out() -> void:
	blackout.global_position = global_position - Vector2(0.0, 58.0)
	add_child(blackout)
