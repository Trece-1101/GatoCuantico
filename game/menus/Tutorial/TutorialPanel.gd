extends NinePatchRect

export(String, "nill", "text_one", "text_two", "text_three") var text_to_show := ""

var text_one := "Solo puedes observar una habitacion.\nTienes un tiempo limitado para analizar el escenario y hacerlo.\nAl finalizar el tiempo se seleccionara una al azar.\nEl objetivo es llevar a schodi, el de la habitacion que seleccionaste, hasta la puerta.\nSin embargo el Schodi no seleccionado va a replicar todos los movimientos del otro y solo podras saber si esta vivo o muerto una vez que ingreses a la puerta con 'tu' Schodi."
var text_two := "En el camino vas a encontrar peligros que van a dificultar tu experimento.\nEs importante tomarse un tiempo en analizar los escenarios y todas las referencias.\nUna simple planta puede ayudar a intuir cosas que no podemos obserbar."
var text_three := ""

func _ready() -> void:
	if text_to_show == "text_one":
		$Label.text = text_one
	elif text_to_show == "text_two":
		$Label.text = text_two
	elif text_to_show == "text_three":
		pass
	
	get_tree().paused = true


func _on_Button_pressed() -> void:
	get_tree().paused = false
	queue_free()
