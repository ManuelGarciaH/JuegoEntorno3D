# SingletonContador.gd (Nodo singleton)

extends Node

# Variable global para almacenar el contador
var contadorGlobal = 0

var contadorPlastic = 0
var contadorPaper = 0
var contadorOrganic = 0
var contadorGlass = 0
var label_contador

var LabelPlastic
var LabelPaper
var LabelGlass
var LabelOrganic

var game_timer
var end_screen

func _ready():
	# Obtener referencias a los nodos Timer y EndScreen
	game_timer = get_node("/root/main/GameTimer")
	end_screen = get_node("/root/main/EndScreen")
	
	# Conectar la señal del temporizador
	game_timer.connect("timeout", Callable(self, "_on_GameTimer_timeout"))
	
	# Iniciar el temporizador
	game_timer.start()

func _on_GameTimer_timeout():
	mostrar_pantalla_de_fin()

func mostrar_pantalla_de_fin():
	Global.contadorGlobal = contadorGlobal
	get_tree().change_scene_to_file("res://fin.tscn")
	#end_screen.visible = true
	
func _process(delta):
	# Actualizar la etiqueta con el tiempo restante
	var LabelTime = get_node("/root/main/LabelTime")
	var tiempo_restante = game_timer.get_time_left()
	LabelTime.set_text("Tiempo restante: " + str(round(tiempo_restante)))


func obtener_contadorGlobal() -> int:
	return contadorGlobal

# Método para obtener el valor actual del contador
func obtener_contadorPlastic() -> int:
	return contadorPlastic

# Método para incrementar el contador
func incrementar_contadorPlastic():
	contadorPlastic += 1
	mostrar_contadorPlastic()

func reiniciar_contadorPlastic():
	contadorGlobal+=contadorPlastic
	contadorPlastic=0
	label_contador = get_node("/root/main/Label")
	label_contador.set_text("Contador: " + str(contadorGlobal))
	mostrar_contadorPlastic()
	
func mostrar_contadorPlastic():
	LabelPlastic = get_node("/root/main/LabelPlastic")
	LabelPlastic.set_text("Plastico: " + str(contadorPlastic))
	
# Método para obtener el valor actual del contador
func obtener_contadorPaper() -> int:
	return contadorPaper

# Método para incrementar el contador
func incrementar_contadorPaper():
	contadorPaper += 1
	mostrar_contadorPaper()

func reiniciar_contadorPaper():
	contadorGlobal+=contadorPaper
	contadorPaper=0
	label_contador = get_node("/root/main/Label")
	label_contador.set_text("Contador: " + str(contadorGlobal))
	mostrar_contadorPaper()

func mostrar_contadorPaper():
	LabelPaper = get_node("/root/main/LabelPaper")
	LabelPaper.set_text("Papel: " + str(contadorPaper))

# Método para obtener el valor actual del contador
func obtener_contadorGlass() -> int:
	return contadorGlass

# Método para incrementar el contador
func incrementar_contadorGlass():
	contadorGlass += 1
	mostrar_contadorGlass()

func reiniciar_contadorGlass():
	contadorGlobal+=contadorGlass
	contadorGlass=0
	label_contador = get_node("/root/main/Label")
	label_contador.set_text("Contador: " + str(contadorGlobal))
	mostrar_contadorGlass()

func mostrar_contadorGlass():
	LabelGlass = get_node("/root/main/LabelGlass")
	LabelGlass.set_text("Vidrio: " + str(contadorGlass))

# Método para obtener el valor actual del contador
func obtener_contadorOrganic() -> int:
	return contadorOrganic

# Método para incrementar el contador
func incrementar_contadorOrganic():
	contadorOrganic += 1
	mostrar_contadorOrganic()

func reiniciar_contadorOrganic():
	contadorGlobal+=contadorOrganic
	contadorOrganic=0
	label_contador = get_node("/root/main/Label")
	label_contador.set_text("Contador: " + str(contadorGlobal))
	mostrar_contadorOrganic()
	
func mostrar_contadorOrganic():
	LabelOrganic = get_node("/root/main/LabelOrganic")
	LabelOrganic.set_text("Organico: " + str(contadorOrganic))
