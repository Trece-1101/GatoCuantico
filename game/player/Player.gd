class_name Player
extends KinematicBody2D

export var speed := 400.0
export var gravity := 20.0
export var jump_force := 400.0
export var wall_jump_force := 600.0
export var dash_force := 1500.0
export var max_jumps := 1

var movement := Vector2.ZERO
var jumps := 0
var can_jump = true
var can_wall_jump = false setget set_can_wall_jump
var can_dash = false setget set_can_dash
var wall_jumped = false
var dashed = false
var input_enabled = false

func set_can_wall_jump(value:bool) -> void:
	can_wall_jump = value

func set_can_dash(value:bool) -> void:
	can_dash = value

func _ready() -> void:
	$AnimatedSprite.play("idle")
	player_enabled(false)
	Events.connect("half_room_selected", self, "_on_room_selected")
	Events.connect("enable_player", self, "_on_room_selected")
	Events.connect("player_in_portal", self, "disabled_player")

func _unhandled_input(event: InputEvent) -> void:
	if not input_enabled:
		return
	
	if event.is_action_pressed("jump"):
		manage_jump()
	elif event.is_action_pressed("dash") and can_dash and not dashed:
		dash()

func _physics_process(_delta: float) -> void:
	if not dashed:
		movement.y += gravity
	
	if not wall_jumped and not dashed:
		movement.x = get_horizontal_movement() * speed

	move_and_slide(movement, Vector2.UP)
	
	if is_on_floor():
		movement.y = 0
		can_jump = true
		jumps = 0
	
	if is_on_ceiling():
		movement.y = gravity


func get_horizontal_movement() -> float:
	if not input_enabled:
		return 0.0
	var h_mov := Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		
	if h_mov == 0:
		if is_on_floor():
			$AnimatedSprite.play("idle")
		else:
			if movement.y < 0:
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("fall")
	else:
		$AnimatedSprite.scale.x = h_mov
		$AnimatedSprite.play("run")

	
	return h_mov

func manage_jump() -> void:
	if $WallDetectors.get_is_colliding_wall() and not is_on_floor() and can_wall_jump:
		input_enabled = false
		$InputCooldown.start()
		movement = Vector2.ZERO
		movement = Vector2($WallDetectors.get_dir() * wall_jump_force, -jump_force * 0.6)
		wall_jumped = true
		$AnimatedSprite.play("jump")
		return
	
	if can_jump:
		movement.y = 0.0
		movement.y = -jump_force
		jumps += 1
		can_jump = (max_jumps - jumps)
		$AnimatedSprite.play("jump")
		return

func dash() -> void:
	dashed = true
	movement = Vector2.ZERO
	$TweenDash.interpolate_property(
		self,
		"movement:x",
		0.0,
		dash_force * $AnimatedSprite.scale.x,
		0.15,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
	)
	$TweenDash.start()

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

func disabled_player() -> void:
	movement = Vector2.ZERO
	$AnimatedSprite.play("idle")
	player_enabled(false)

func player_enabled(valor:bool) -> void:
	set_process(valor)
	set_physics_process(valor)
	input_enabled = valor

func _on_room_selected() -> void:
	player_enabled(true)

func _on_InputCooldown_timeout() -> void:
	input_enabled = true
	wall_jumped = false


func _on_TweenDash_tween_all_completed() -> void:
	dashed = false
