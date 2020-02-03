extends Node2D

var colores = ["red","green","blue","yellow"]

var nombres = ["cinta","engranaje","focos","llave"]


func _ready():
	var contenedores = get_tree().get_nodes_in_group("contenedor")
	var reco = len(contenedores) - 1
	var azar
	randomize()
	for color in colores:
		azar = randi() % ( reco + 1 )
		randi() 
		contenedores[azar].color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1
		
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
	for color in nombres:
		azar =  randi() % ( reco + 1 )
		contenedores[azar].objeto_color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1

		azar =  randi() % ( reco + 1 )
		contenedores[azar].objeto_color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1
	
	

func _invertir(contenedores, ref, fin):
	var auxiliar = contenedores[ref] 
	contenedores[ref] = contenedores[fin]
	contenedores[fin] = auxiliar