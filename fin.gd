extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var label2 = get_node("Label2")
	label2.set_text("Puntuación obtenida: " + str(Global.contadorGlobal))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_menu_princial_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_volver_jugar_pressed():
	get_tree().change_scene_to_file("res://scene/main.tscn")
