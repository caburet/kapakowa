extends Node2D

# Declare member variables here. Examples:
# var a = 2
var seg = 0


var cinta = load("res://Assets/objetos/cinta.png") # Godot loads the resource at compile-time
var engranaje = load("res://Assets/objetos/engranajes.png") # Godot loads the resource at compile-time
var focos = load("res://Assets/objetos/focos.png") # Godot loads the resource at compile-time
var llave = load("res://Assets/objetos/llave.png") # Godot loads the resource at compile-time

#var colores = ["blue","yellow"] 
var colores = ["red","green","blue","yellow"] 

var nombres = ["cinta","engranaje","focos","llave"]

var texturas = { "cinta": cinta, "engranaje": engranaje ,"focos" : focos,"llave":llave}

func _ready():
	if int(globals.numberplayers)==1:
		colores = ["blue"] 
		$Players/Player_2.hide()
		$Players/Player_3.hide()
		$Players/Player_4.hide()	
	if int(globals.numberplayers)==2:
		colores = ["blue","yellow"] 
		$Players/Player_3.hide()
		$Players/Player_4.hide()
	if int(globals.numberplayers)==3:
		colores = ["blue","green","yellow"] 
		$Players/Player_4.hide()		
	var contenedores = $Contenedores.get_children()
	var reco = len(contenedores) - 1
	var azar
	randomize()
	for color in colores:
		azar = randi() % ( reco + 1 )
		contenedores[azar].color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1
		
		azar =  randi() % ( reco + 1 )
		contenedores[azar].color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1
		if len(colores)==2:
			azar = randi() % ( reco + 1 )
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
		while contenedores[azar].objeto_color == color:
			azar =  randi() % ( reco + 1 )
		contenedores[azar].objeto_color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1

		azar =  randi() % ( reco + 1 )
		while contenedores[azar].objeto_color == color:
			azar =  randi() % ( reco + 1 )
		contenedores[azar].objeto_color = color
		_invertir(contenedores,azar,reco)
		reco = reco -1
		if len(colores)==2:
			azar =  randi() % ( reco + 1 )
			while contenedores[azar].objeto_color == color:
				azar =  randi() % ( reco + 1 )
			contenedores[azar].objeto_color = color
			_invertir(contenedores,azar,reco)
			reco = reco -1
	
			azar =  randi() % ( reco + 1 )
			while contenedores[azar].objeto_color == color:
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



func _on_Timer_timeout():
	if seg >= 60:
		get_tree().change_scene("res://Scenes/fin.tscn")
	seg += 1
	$Label.text= str(60 - seg)
	pass # Replace with function body.


func _on_Timer_luces_timeout():

	var random= randi()%11+1
	if randi()%11+1<random:
		$LucesMapa/Light2D2.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D3.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D4.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D5.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D6.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D7.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D8.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D9.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D10.hide()
	$Timer_luces_on.start()
	pass # Replace with function body.


func _on_Timer_luces_on_timeout():
	$LucesMapa/Light2D2.show()
	$LucesMapa/Light2D3.show()
	$LucesMapa/Light2D4.show()
	$LucesMapa/Light2D5.show()
	$LucesMapa/Light2D6.show()
	$LucesMapa/Light2D7.show()
	$LucesMapa/Light2D8.show()
	$LucesMapa/Light2D9.show()
	$LucesMapa/Light2D10.show()
	$Timer_luces_on.stop()
	pass # Replace with function body.
