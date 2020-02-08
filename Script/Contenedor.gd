extends Area2D

export (String) var color = ""
export (String) var objeto_color = ""
export (String) var objeto_nombre= ""
export (PackedScene) var referencia = null;
var textura

var globo = load("res://Assets/globos/globos-06.png") 
var exclamacionBlue = load("res://Assets/globos/globos-02.png") 
var exclamacionYellow = load("res://Assets/globos/globos-04.png") 
var exclamacionRed= load("res://Assets/globos/globos-03.png") 
var exclamacionGreen = load("res://Assets/globos/globos-05.png") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#
func _on_Area2D_body_entered(body):
	print("entra algo")
	print("contenedor",body.get_groups())
	if body.is_in_group("player"):
		print("Entra player ","color Player: ",body.color," colorContenedor : ", color)
		if body.get_color() == color :
			print("mismo color")
			$Particles2D.hide()
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
		else:
			
			print("Tiene que abrirlo--->"+ color)
			if (color== "blue"):
				$exclam.set_texture(exclamacionBlue)
			if (color== "red"):
				$exclam.set_texture(exclamacionRed)
			if (color== "green"):
				$exclam.set_texture(exclamacionGreen)
			if (color == "yellow"):
				$exclam.set_texture(exclamacionYellow)
			$globo.show()
			$exclam.show()
			yield(get_tree().create_timer(1.0), "timeout")
			$globo.hide()
			$exclam.hide()


