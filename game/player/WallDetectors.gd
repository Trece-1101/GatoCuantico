extends Node2D

var is_colliding_wall := false setget ,get_is_colliding_wall

onready var raycast_up_right := $RayCast2D2
onready var raycast_down_right := $RayCast2D
onready var raycast_up_left := $RayCast2D4
onready var raycast_down_left := $RayCast2D3

var dir := 0 setget ,get_dir

func get_is_colliding_wall() -> bool:
	return is_colliding_wall

func get_dir() -> int:
	return dir


func _process(delta: float) -> void:
	var left_wall: bool = raycast_up_left.is_colliding() and raycast_down_left.is_colliding()
	var right_wall: bool= raycast_down_right.is_colliding() and raycast_up_right.is_colliding()
	is_colliding_wall = left_wall or right_wall
	if left_wall:
		dir = 1
	else:
		dir = -1
