extends Node

var max_level:int = 10

var observable_player:Player = null setget set_observable_player ,get_observable_player
var non_observable_player:Player = null setget set_non_observable_player ,get_non_observable_player

onready var current_unlock_level:int = 0 setget set_current_unlock_level, get_current_unlock_level

func set_observable_player(value:Player) -> void:
	observable_player = value

func get_observable_player() -> Player:
	return observable_player

func set_non_observable_player(value:Player) -> void:
	non_observable_player = value

func get_non_observable_player() -> Player:
	return non_observable_player

func set_current_unlock_level(value:int) -> void:
	current_unlock_level = value

func get_current_unlock_level() -> int:
	return current_unlock_level

func new_unlock_level() -> void:
	current_unlock_level += 1
	if current_unlock_level > 10:
		current_unlock_level = 10
