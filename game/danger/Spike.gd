class_name Spike
extends Area2D

#dd4e54 Rojo
#2185d5 Azul

func set_color(room:String) -> void:
	if "Blue" in room:
#		$Sprite.modulate = Color("d92f36")
		$Sprite.modulate = Color.red
	elif "Red" in room:
#		$Sprite.modulate = Color("0b64ab")
		$Sprite.modulate = Color.blue


func _on_body_entered(body: Node) -> void:
	body.die()
