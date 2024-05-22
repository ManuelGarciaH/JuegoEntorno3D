extends Node3D

func _on_area_3d_body_entered(body):
	var singleton = get_node("/root/main/SingletonContador")
	
	print(singleton.reiniciar_contadorOrganic())
	pass
