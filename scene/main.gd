extends Node3D

var objetos_plastico = []

var x_minCup = -5
var x_maxCup = 28
var z_minCup = 0
var z_maxCup = 45

var x_minBottle = -1
var x_maxBottle = 5
var z_minBottle = -0.8
var z_maxBottle = 9.7

var x_minShip= -1
var x_maxShip = 5
var z_minShip = -0.5
var z_maxShip = 9

var x_minGlassCup = -1
var x_maxGlassCup = 5.5
var z_minGlassCup = -0.7
var z_maxGlassCup = 9.2

var x_minBanana = -10
var x_maxBanana = 42
var z_minBanana = -10
var z_maxBanana = 80

var x_minCherry = -2
var x_maxCherry = 10
var z_minCherry = -1
var z_maxCherry = 19

# Número de objetos de plástico a generar
var objetosMaximos = 20
var objetosActuales = 0

func _ready():
	generar_objetos_plastico()

var plastic_cup_scene : PackedScene = preload("res://assets/objectEscenes/plastic_cupv_2.tscn")
var plastic_bottle_scene : PackedScene = preload("res://plastic_bottle.tscn")
var paperBag_scene : PackedScene = preload("res://paper_bag.tscn")
var paperShip_scene : PackedScene = preload("res://paper_ship.tscn")
var glass_scene : PackedScene = preload("res://glass.tscn")
var glassCup_scene : PackedScene = preload("res://glass_cup.tscn")
var banana_scene : PackedScene = preload("res://banana.tscn")
var cherry_scene : PackedScene = preload("res://cherry.tscn")

# Función para generar los objetos de plástico
func generar_objetos_plastico():
	for i in range(objetosMaximos-objetosActuales):
		objetosActuales+=1
		
		# Genera un número aleatorio entre 0 y 7
		var opcion = randi_range(0, 7)
		#var opcion = 7

		# Utiliza un switch para determinar qué objeto instanciar
		match opcion:
			0:
				var x = randi_range(x_minCup, x_maxCup)
				var z = randi_range(z_minCup, z_maxCup)
				var plastic_cup_instance = plastic_cup_scene.instantiate()
				plastic_cup_instance.translate_object_local(Vector3(x, -2.5, z))
				add_child(plastic_cup_instance)
				print(objetosActuales)
			1:
				var x = randi_range(x_minBottle, x_maxBottle)
				var z = randi_range(z_minBottle, z_maxBottle)
				var paperBag_instance = paperBag_scene.instantiate()
				paperBag_instance.translate_object_local(Vector3(x, -0.6, z))
				add_child(paperBag_instance)
				print(objetosActuales)
			2:
				var x = randi_range(x_minBottle, x_maxBottle)
				var z = randi_range(z_minBottle, z_maxBottle)
				var plastic_bottle_instance = plastic_bottle_scene.instantiate()
				plastic_bottle_instance.translate_object_local(Vector3(x, -0.5, z))
				add_child(plastic_bottle_instance)
				print(objetosActuales)
			3:
				var x = randi_range(x_minShip, x_maxShip)
				var z = randi_range(z_minShip, z_maxShip)
				var paperShip_instance = paperShip_scene.instantiate()
				paperShip_instance.translate_object_local(Vector3(x, -0.5, z))
				add_child(paperShip_instance)
				print(objetosActuales)
			4:
				var x = randi_range(x_minBottle, x_maxBottle)
				var z = randi_range(z_minBottle, z_maxBottle)
				var glass_instance = glass_scene.instantiate()
				glass_instance.translate_object_local(Vector3(x, -0.5, z))
				add_child(glass_instance)
				print(objetosActuales)
			5:
				var x = randi_range(x_minGlassCup, x_maxGlassCup)
				var z = randi_range(z_minGlassCup, z_maxGlassCup)
				var glassCup_instance = glassCup_scene.instantiate()
				glassCup_instance.translate_object_local(Vector3(x, -0.5, z))
				add_child(glassCup_instance)
				print(objetosActuales)
			6:
				var x = randi_range(x_minBanana, x_maxBanana)
				var z = randi_range(z_minBanana, z_maxBanana)
				var banana_instance = banana_scene.instantiate()
				banana_instance.translate_object_local(Vector3(x, -4, z))
				add_child(banana_instance)
				print(objetosActuales)
			7:
				var x = randi_range(x_minCherry, x_maxCherry)
				var z = randi_range(z_minCherry, z_maxCherry)
				var cherry_instance = cherry_scene.instantiate()
				cherry_instance.translate_object_local(Vector3(x, -1, z))
				add_child(cherry_instance)
				print(objetosActuales)
		

func objeto_eliminado():
	objetosActuales -=1
	generar_objetos_plastico()
