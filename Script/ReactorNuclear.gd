extends Node2D

var tiempoRequerido = 2

 #["cinta","engranaje","focos","llave"]
export (String) var objeto_1 = "engranaje"
export (String) var objeto_2 = "focos"
export (String) var objeto_3 = "llave"
export (String) var objeto_4 = "cinta"

var objeto_1_faltante = false
var objeto_2_faltante = false
var objeto_3_faltante = false
var objeto_4_faltante = false

var objeto_1_proceso = false
var objeto_2_proceso = false
var objeto_3_proceso = false
var objeto_4_proceso = false

var objeto_1_jugador = null
var objeto_2_jugador = null
var objeto_3_jugador = null
var objeto_4_jugador = null

func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
#	print("Reactor entra algo")
	if body.is_in_group("player"):
#		print("entro un player")
		if (  body.objeto_nombre() == objeto_1):
			print("Reactor : entro ")
			objeto_1_proceso = true
			objeto_1_jugador = body
			$Timer_1.start(tiempoRequerido)
			
		elif( body.objeto_nombre() == objeto_2):
			print("Reactor : entro ")
			objeto_2_proceso = true
			objeto_2_jugador = body
			$Timer_2.start(tiempoRequerido)
		elif(body.objeto_nombre() == objeto_3):
			print("Reactor : entro ")
			objeto_3_proceso = true
			objeto_3_jugador = body
			$Timer_3.start(tiempoRequerido)
		elif( body.objeto_nombre() == objeto_4):
			print("Reactor : entro ")
			objeto_4_proceso = true
			objeto_4_jugador = body
			$Timer_4.start(tiempoRequerido)
#		else:
#			print("disinto objeto")
		
func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		if !objeto_1_faltante && objeto_1_proceso :
			$Timer_1.stop()
#			print("no se termino")
		if !objeto_2_faltante && objeto_2_proceso :
			$Timer_2.stop()
		if !objeto_3_faltante && objeto_3_proceso :
			$Timer_3.stop()
		if !objeto_4_faltante && objeto_4_proceso :
			$Timer_4.stop()


func _on_Timer_1_timeout():
	print("termino 1")
	$Timer_1.stop()
	objeto_1_faltante = true
	objeto_1_jugador.set_cargarObjetos(null)
	objeto_1_jugador.get_child(6).hide()
	_termino()


func _on_Timer_2_timeout():
	print("termino 2")
	$Timer_2.stop()
	objeto_2_faltante = true
	objeto_2_jugador.set_cargarObjetos(null)
	objeto_2_jugador.get_child(6).hide()
	_termino()

func _on_Timer_3_timeout():
	print("termino 3")
	$Timer_3.stop()
	objeto_3_faltante = true
	objeto_3_jugador.set_cargarObjetos(null)
	objeto_3_jugador.get_child(6).hide()
	_termino()

func _on_Timer_4_timeout():
	print("termino 4")
	$Timer_4.stop()
	objeto_4_faltante = true
	objeto_4_jugador.set_cargarObjetos(null)
	objeto_4_jugador.get_child(6).hide()
	_termino()
	
func _termino():
	print (objeto_1_faltante)
	print (objeto_2_faltante)
	print (objeto_3_faltante)
	print (objeto_4_faltante)
	if(objeto_1_faltante && objeto_2_faltante && objeto_3_faltante && objeto_4_faltante ):
		self.get_tree().change_scene("res://Scenes/win.tscn")
