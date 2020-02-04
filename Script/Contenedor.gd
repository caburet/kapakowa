extends Area2D

export (String) var color = "blue"
export (String) var objeto_color = ""
export (String) var objeto_nombre= ""
export (PackedScene) var referencia = null;
var textura
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#
func _on_Area2D_body_entered(body):
#	print("entra algo")
#	print("contenedor",body.get_groups())
	if body.is_in_group("player"):
#		print("entra player ","body color: ",body.color," color : ", color)
		if body.get_color() == color :
			#print("mismo color")
			var nuevo_objeto = referencia.instance()
			self.get_parent().add_child(nuevo_objeto)
			nuevo_objeto.color = objeto_color
			nuevo_objeto.nombre = objeto_nombre
			nuevo_objeto.get_node("Sprite").texture = textura
			nuevo_objeto.get_node("Sprite").scale.x = 0.75
			nuevo_objeto.get_node("Sprite").scale.y = 0.75
			nuevo_objeto.position.x = self.position.x
			nuevo_objeto.position.y = self.position.y
			self.queue_free()
#		else:
#print("distinto color")
#		else:
#			$exclamacion.Visible
			
