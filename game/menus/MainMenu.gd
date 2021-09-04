extends Node

export(String, FILE, "*.tscn") var level_selection_menu = ""
export(String, FILE, "*.tscn") var credits_menu = ""
export(String, FILE, "*.tscn") var controls_menu = ""

var counter := 0

var texts := [
	"En 1935 Erwin Schrodinger ideo un experimento mental descrito como una paradoja. Dicho experimento fue denominado 'El gato de schrodinger'",
	"El escenario presenta un gato hipotetico que puede estar simultaneamente vivo y muerto. A este estado se lo conoce como superposicion cuantica",
	"En la mecanica cuantica la teoria predominante, llamada interpretacion de Copenhague, establece que un sistema cuantico permanece en superposicion hasta que es observado",
	"Cuando es observado, la superposicion colapsa en uno u otro de los posibles estados definidos. La sola accion de observar modifica el estado de un sistema.",
	"Si no podemos observar. ¿Podemos controlar el resultado? ¿Y si el solo hecho de no observarlo es una forma de control? ¿O acaso el control esta limitado a observarlo y colapsar en un estado?"
]

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	reset_text($BottomLeft/Label)
	reset_text($BottomRight/Label)
	if GameMusic.get_music_playing() != "menu":
		GameMusic.play_music("menu")

func _on_Quit_pressed() -> void:
	get_tree().quit()

func _on_Play_pressed() -> void:
	GameMusic.play_button()
	get_tree().change_scene(level_selection_menu)


func _on_Credits_pressed() -> void:
	GameMusic.play_button()
	get_tree().change_scene(credits_menu)


func _on_Controls_pressed() -> void:
	GameMusic.play_button()
	get_tree().change_scene(controls_menu)


func _on_PlayTut_pressed() -> void:
	get_tree().change_scene("res://game/levels/Tutorial/Level1Tutorial.tscn")


func _on_BottomLeft_mouse_entered() -> void:
	$BottomLeft.color = Color.white
	give_text($BottomLeft/Label)


func _on_BottomRight_mouse_entered() -> void:
	$BottomRight.color = Color.white
	give_text($BottomRight/Label)

func give_text(label:Label) -> void:
	if counter >= texts.size():
		counter = 0
	label.modulate = Color.black
	label.text = texts[counter]
	counter += 1

func end_text() -> bool:
	return counter >= texts.size()

func reset_text(label:Label) -> void:
	label.modulate = Color.white
	label.text = "Observar"


func _on_BottomLeft_mouse_exited() -> void:
	$BottomLeft.color = Color.black
	reset_text($BottomLeft/Label)

func _on_BottomRight_mouse_exited() -> void:
	$BottomRight.color = Color.black
	reset_text($BottomRight/Label)
