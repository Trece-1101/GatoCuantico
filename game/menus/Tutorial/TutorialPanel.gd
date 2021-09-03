extends NinePatchRect

export var text_index:int = 0

var text_placeholder := "Texto"
var text_one := "Solo puedes observar una habitacion.\nTienes un tiempo limitado para analizar el escenario y hacerlo.\nAl finalizar el tiempo se seleccionara una al azar.\nEl objetivo es llevar a schodi, el de la habitacion que seleccionaste, hasta la puerta.\nSin embargo el Schodi no seleccionado va a replicar todos los movimientos del otro y solo podras saber si esta vivo o muerto una vez que ingreses a la puerta con 'tu' Schodi."
var text_two := "En el camino vas a encontrar peligros que van a dificultar tu experimento.\nEs importante tomarse un tiempo en analizar los escenarios y todas las referencias.\nUna simple planta puede ayudar a intuir cosas que no podemos obserbar."
var text_three := "Tambien vas a encontrar PowerUps para ayudarte.\nPor ejemplo 'salto' te va a dar la habilidad de realizar un doble salto.\nPero mucho cuidado, las habilidades solo impactaran en el Schodi que las consuma, no en ambos."
var text_four := "'Dash' te va a dar la habilidad de realizar un Dash.\nOtra vez no olvides recordad que la habilidad solo sera adquirida por el Schodi que la consuma.\nElige sabiamente tu observacion.\nPuedes dashear con SHIFT"

var texts := [
	text_placeholder,
	text_one,
	text_two,
	text_three,
	text_four
]

func _ready() -> void:
	$Label.text = texts[text_index]
#	if text_to_show == "text_one":
#		$Label.text = text_one
#	elif text_to_show == "text_two":
#		$Label.text = text_two
#	elif text_to_show == "text_three":
#		$Label.text = text_three
	
	get_tree().paused = true


func _on_Button_pressed() -> void:
	get_tree().paused = false
	queue_free()
