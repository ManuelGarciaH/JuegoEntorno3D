extends Node3D

var contador = 0
var label_contador

# Lista para almacenar los objetos de plástico
var objetos_plastico = []

func recoger_objeto(objeto):
	contador += 1
	# Elimina el objeto recogido de la lista
	objetos_plastico.erase(objetos_plastico.find(objeto))
	print("tomado")
	queue_free()
	# Incrementa el contador en el nodo singleton
	var singleton = get_node("/root/main/SingletonContador")
	singleton.incrementar_contadorPlastic()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Función para recoger el objeto y aumentar el contador
func _on_area_3d_body_entered(body):
	recoger_objeto(body)

# Rango de coordenadas para la generación aleatoria
var x_min = 10.10
var x_max = 18.30
var z_min = -35.90
var z_max = -25.70

# Número de objetos de plástico a generar
var num_objetos_plastico = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	generar_objetos_plastico()

#@export var plastic_cup_scene: PackedScene
var plastic_cup_instance = ResourceLoader.load("res://plastic_cupv_2.tscn").instance()


#var plastic_cup_scene : PackedScene = preload("res://scene/main.tscn")

# Función para generar los objetos de plástico
func generar_objetos_plastico():
	for i in range(num_objetos_plastico):
		# Genera coordenadas aleatorias dentro del rango especificado
		var x = randi_range(x_min, x_max)
		var z = randi_range(z_min, z_max)

		# Instancia el objeto de plástico en las coordenadas generadas
		var plastic_cup_instance = plastic_cup_scene.instantiate()
		# Si el objeto instanciado es un Spatial o un Node, establece su posición
		if plastic_cup_instance is Node:
			plastic_cup_instance.translate_object_local(Vector3(x, -1, z))
			get_node("/root/main").add_child.call_deferred(plastic_cup_instance)
			#add_child(plastic_cup_instance)
			
			# Agrega el objeto a la lista de objetos de plástico
			objetos_plastico.append(plastic_cup_instance)
			print(objetos_plastico.size())
		else:
			print("El objeto instanciado no es un Spatial o un Node.")
