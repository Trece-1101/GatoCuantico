extends Node2D

func _ready() -> void:
	$Sprite.visible = false
	$Sprites.visible = true
	if "Blue" in get_parent().name:
		pick_random_sprite($Sprites/SpriteVisualRed.get_children())
	elif "Red" in get_parent().name:
		pick_random_sprite($Sprites/SpriteVisualBlue.get_children())

func pick_random_sprite(sprites:Array) -> void:
	var ran_index:int = randi() % sprites.size()
	sprites[ran_index].visible = true


func _on_PlayerDetector_body_entered(_body: Node) -> void:
	$AnimationPlayer.play("rotate")
