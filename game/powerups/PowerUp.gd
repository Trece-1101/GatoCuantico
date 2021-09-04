class_name PowerUp
extends Node2D

export var red_texture:Texture = null
export var blue_texture:Texture = null


func _ready() -> void:
	var label_pos:Vector2 = $Sprite/Label.rect_position
	if "Blue" in get_parent().name:
		$Sprite.texture = blue_texture
	elif "Red" in get_parent().name:
		$Sprite.texture = red_texture
	$Sprite/Label.rect_position = label_pos

func _on_PlayerDetector_body_entered(body: Node) -> void:
	$AnimationPlayer.play("consume")
	$PickUpSFX.play()
	$PlayerDetector/CollisionShape2D.set_deferred("disabled", true)
	var player:Player = body
	give_power(player)

func give_power(player: Player) -> void:
	pass
