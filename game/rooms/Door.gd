extends Node2D

func set_is_enable(value:bool) -> void:
	$PlayerDetector/CollisionShape2D.set_deferred("disabled", not value)

func _on_PlayerDetector_body_entered(_body: Node) -> void:
	$AnimationPlayer.play("open")
	$DoorCollider/CollisionShape2D.set_deferred("disabled", false)
	$PlayerDetector/CollisionShape2D.set_deferred("disabled", true)


func _on_DoorCollider_body_entered(body: Node) -> void:
	$DoorCollider/CollisionShape2D.set_deferred("disabled", true)
	body.enter_portal(global_position - Vector2(0.0, 64.0))
