extends KinematicBody2D


#--------------------MOVIMIENTO EN 8 SENTIDOS-----------------------------
export (String) var color = "blue"

export (int) var speed = 200

var objeto = null

var velocity = Vector2()

func _ready():
	self.z_index = 3

func get_input():
#    velocity = Vector2()
#    if Input.is_action_pressed('ui_right'):
#        velocity.x += 1
#    if Input.is_action_pressed('ui_left'):
#        velocity.x -= 1
#    if Input.is_action_pressed('ui_down'):
#        velocity.y += 1
#    if Input.is_action_pressed('ui_up'):
#        velocity.y -= 1
#    velocity = velocity.normalized() * speed
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$animacion.animation = "derecha"
		$animacion.flip_h=false
		$animacion.play()

	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$animacion.animation = "derecha"
		$animacion.flip_h=true
		$animacion.play()

	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		$animacion.animation = "frente"
#		$animacion.flip_v=false
		$animacion.play()

	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		$animacion.animation = "arriba"
#		$animacion.flip_v=true
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
#		print("Se anula el objeto")
