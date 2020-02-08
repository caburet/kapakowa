extends Area2D

export (String) var color = "id"
export (String) var nombre = "nombre"

func _ready():
	pass
	
func get_nombre():
	return nombre

func _on_Area2D_body_entered(body):
#	print("entra algo")
#	print("objeto",body.get_groups())
	if body.is_in_group("player"):
#		print("entra player")
		if body.get_color() == color :
#			print("mismo color")
			body.set_cargarObjetos(self)
#		else:
#			print("distinto color")
	else:
		print("no es jugador")
