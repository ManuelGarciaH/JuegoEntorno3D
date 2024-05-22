extends Control

func _ready():
	# Conectar el evento 'pressed' del botón 'Comenzar juego' a la función 'iniciar_juego'
	$BotonComenzar.connect("pressed", self, "iniciar_juego")

func iniciar_juego():
	# Cargar y presentar la escena principal del juego
	var juego_principal = preload("res://main.tscn")
	get_tree().change_scene(juego_principal)
