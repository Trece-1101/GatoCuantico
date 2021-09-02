class_name Player
extends KinematicBody2D

export var speed := 400.0
export var gravity := 20.0
export var jump_force := 400.0
export var max_jumps := 1

var movement := Vector2.ZERO
var jumps := 0
var can_jump = true

func _ready() -> void:
	$AnimatedSprite.play("idle")
	player_enabled(false)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and can_jump:
		jump()

func _physics_process(delta: float) -> void:
	movement.y += gravity
	movement.x = get_horizontal_movement() * speed
	
	move_and_slide(movement, Vector2.UP)
	
	if is_on_floor():
		movement.y = 0
		can_jump = true
		jumps = 0


func get_horizontal_movement() -> float:
	var h_mov := Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	$AnimatedSprite.flip_h = h_mov < 0.0
	
	if h_mov == 0 and is_on_floor():
		$AnimatedSprite.play("idle")
	else:
		$AnimatedSprite.play("run")

	
	return h_mov

func jump() -> void:
	movement.y = -jump_force
	jumps += 1
	can_jump = (max_jumps - jumps)
	$AnimatedSprite.play("jump")

func enter_portal(center:Vector2) -> void:
	player_enabled(false)
	$AnimatedSprite.play("idle")
	$AnimationPlayer.play("shrink")
	$CollisionShape2D.set_deferred("disabled", true)
	$Tween.interpolate_property(
		self,
		"global_position",
		global_position,
		center,
		0.5,
		Tween.TRANS_ELASTIC,
		Tween.EASE_IN_OUT
	)
	$Tween.start()

func _on_Tween_tween_all_completed() -> void:
	Events.emit_signal("player_in_portal")

func player_enabled(valor:bool) -> void:
	set_process(valor)
	set_physics_process(valor)
