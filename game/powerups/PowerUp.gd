class_name PowerUp
extends Node2D



func _on_PlayerDetector_body_entered(body: Node) -> void:
	$PlayerDetector/CollisionShape2D.set_deferred("disabled", true)
	give_power(body)

func give_power(body: Node) -> void:
	pass
