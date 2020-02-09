extends Area2D

export (String) var color = "id"
export (String) var nombre = "nombre"
var cinta = load("res://Assets/objetos/cinta.png") # Godot loads the resource at compile-time
var engranaje = load("res://Assets/objetos/engranajes.png") # Godot loads the resource at compile-time
var focos = load("res://Assets/objetos/focos.png") # Godot loads the resource at compile-time
var llave = load("res://Assets/objetos/llave.png") # Godot loads the resource at compile-time
var textura
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
			print (nombre)
			if nombre=='cinta':
				textura = cinta
			if nombre=='engranaje':
				textura = engranaje
			if nombre=='focos':
				textura = focos
			if nombre=='llave':
				textura = llave						
			body.set_cargarObjetos(self)
			body.get_child(6).show()
			body.get_child(6).texture = textura
			
#		else:
#			print("distinto color")
	else:
		print("no es jugador")
