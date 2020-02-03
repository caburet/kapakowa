extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (String) var color = "id"
export (String) var nombre = "nombre"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _on_Moneda_body_entered(body):
#	print("entra algo")
	if body.is_in_group("player"):
#		print("entra player")
		if body.get_color() == color :
#			print("mismo color")
			body.set_cargarObjetos(self)
#		else:
#			print("distinto color")
			
func get_nombre():
	return nombre