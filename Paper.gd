extends Node3D

const SPEED = 1.8

func recoger_objeto(objeto):
	var audioObjeto =  get_node("/root/main/AudioObjeto")
	queue_free()
	audioObjeto.play()
	var main = get_node("/root/main")
	main.objeto_eliminado()
	# Incrementa el contador en el nodo singleton
	var singleton = get_node("/root/main/SingletonContador")
	singleton.incrementar_contadorPaper()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(SPEED))

# Función para recoger el objeto y aumentar el contador
func _on_area_3d_body_entered(body):
	var singleton = get_node("/root/main/SingletonContador")
	var contadorPlastic = singleton.obtener_contadorPlastic()
	var contadorGlass = singleton.obtener_contadorGlass()
	var contadorOrganic = singleton.obtener_contadorOrganic()
	if((contadorPlastic==0) and (contadorGlass==0) and (contadorOrganic==0)):
		recoger_objeto(body)
	else:
		print("No se puede recoger")
