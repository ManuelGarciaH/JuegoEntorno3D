extends Node3D

var contador = 0
var label_contador

func recoger_objeto(objeto):
	contador += 1
	queue_free()
	emit_signal("objeto_eliminado")
	# Incrementa el contador en el nodo singleton
	var singleton = get_node("/root/main/SingletonContador")
	singleton.incrementar_contadorPlastic()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Función para recoger el objeto y aumentar el contador
func _on_area_3d_body_entered(body):
	recoger_objeto(body)
