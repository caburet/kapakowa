extends Node2D

export (int) var can_ancho = 0
export (int) var can_alto = 0
export (PackedScene) var referencia = null;
var x_ref = 64
var y_ref = 64
func _ready():
	var nuevo 
	for x in range(can_ancho):
		nuevo = referencia.instance()
		self.add_child(nuevo)
		nuevo.position.x = x_ref * x
		
		nuevo = referencia.instance()
		self.add_child(nuevo)
		nuevo.position.x = x_ref * x
		nuevo.position.y = (can_alto - 1) * y_ref
		
	for y in range(can_alto):
		nuevo = referencia.instance()
		self.add_child(nuevo)
		nuevo.position.y = y_ref * y
		nuevo = referencia.instance()
		
		self.add_child(nuevo)
		nuevo.position.y = y_ref * y
		nuevo.position.x = (can_ancho - 1 ) * y_ref
	

