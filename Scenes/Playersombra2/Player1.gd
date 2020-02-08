extends KinematicBody2D


#--------------------MOVIMIENTO EN 8 SENTIDOS-----------------------------
export (String) var color = "blue"
export (String) var numero = "1"

export (int) var speed = 200

var objeto = null
var suffix=''
var velocity = Vector2()

func _ready():
	self.z_index = 3

func get_input():
	if numero!="1":
		suffix='_'+numero
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'+suffix):
		velocity.x += 1
		$animacion.animation = "derecha"
		$animacion.flip_h=false
		$animacion.play()

	if Input.is_action_pressed('ui_left'+suffix):
		velocity.x -= 1
		$animacion.animation = "derecha"
		$animacion.flip_h=true
		$animacion.play()

	if Input.is_action_pressed('ui_down'+suffix):
		velocity.y += 1
		$animacion.animation = "frente"
		$animacion.play()

	if Input.is_action_pressed('ui_up'+suffix):
		velocity.y -= 1
		$animacion.animation = "arriba"
		$animacion.play()
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func get_color():
	return color

# consulta si esta cargando algo
func is_cargando():
	return objeto != null

func objeto_nombre():
	if(objeto != null ):
		return objeto.get_nombre()
	else:
		return null

# objeto a cargar
func set_cargarObjetos(objetoCargado ):
	if(objetoCargado != null):
		if( objeto == null):
			print(objetoCargado)
			objeto = objetoCargado

			objeto.position.x = -123
			objeto.position.y = 0
	else:
		objeto = null
