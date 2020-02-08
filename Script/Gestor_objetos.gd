extends Node2D

var cinta = load("res://Assets/objetos/cinta.png") # Godot loads the resource at compile-time
var engranaje = load("res://Assets/objetos/engranajes.png") # Godot loads the resource at compile-time
var focos = load("res://Assets/objetos/focos.png") # Godot loads the resource at compile-time
var llave = load("res://Assets/objetos/llave.png") # Godot loads the resource at compile-time

var colores = ["blue","blue","blue","blue"]  #["red","green","blue","yellow"] 

var nombres = ["cinta","engranaje","focos","llave"]

var texturas = { "cinta": cinta, "engranaje": engranaje ,"focos" : focos,"llave":llave}

func _ready():
	var contenedores = get_tree().get_nodes_in_group("contenedor")
	var reco = len(contenedores) - 1
	var azar
	
	randomize()
	for color in colores:
		azar = randi() % ( reco + 1 )
		contenedores[azar].color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1
		print("Gestor_objeto: ",color)
		
		azar =  randi() % ( reco + 1 )
		contenedores[azar].color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1
	
	reco = len(contenedores) - 1
	for color in colores:
		azar =  randi() % ( reco + 1 )
		contenedores[azar].objeto_color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1

		azar =  randi() % ( reco + 1 )
		contenedores[azar].objeto_color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1

	reco = len(contenedores) - 1
	for nombre in nombres:
		azar =  randi() % ( reco + 1 )
		contenedores[azar].objeto_nombre = nombre
		contenedores[azar].textura = texturas[nombre]
		_invertir(contenedores,azar,reco)
		reco = reco -1

		azar =  randi() % ( reco + 1 )
		contenedores[azar].objeto_nombre = nombre
		contenedores[azar].textura = texturas[nombre]
		_invertir(contenedores,azar,reco)
		reco = reco -1
	
	

func _invertir(contenedores, ref, fin):
	var auxiliar = contenedores[ref] 
	contenedores[ref] = contenedores[fin]
	contenedores[fin] = auxiliar
