extends KinematicBody2D
export (String) var color = "yellow"

export (int) var speed = 200

var objeto = null

var velocity = Vector2()

func _ready():
	self.z_index = 3

#--------------------MOVIMIENTO EN 8 SENTIDOS-----------------------------
# W A S D 

func get_input():
#    velocity = Vector2()
#    if Input.is_action_pressed('ui_right_2'):
#        velocity.x += 1
#    if Input.is_action_pressed('ui_left_2'):
#        velocity.x -= 1
#    if Input.is_action_pressed('ui_down_2'):
#        velocity.y += 1
#    if Input.is_action_pressed('ui_up_2'):
#        velocity.y -= 1
#    velocity = velocity.normalized() * speed

	velocity = Vector2()
	if Input.is_action_pressed('ui_right_2'):
		velocity.x += 1
		$animacion.animation = "derecha"
		$animacion.flip_h=false
		$animacion.play()

	if Input.is_action_pressed('ui_left_2'):
		velocity.x -= 1
		$animacion.animation = "derecha"
		$animacion.flip_h=true
		$animacion.play()

	if Input.is_action_pressed('ui_down_2'):
		velocity.y += 1
		$animacion.animation = "frente"
#		$animacion.flip_v=false
		$animacion.play()

	if Input.is_action_pressed('ui_up_2'):
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
#			print(objetoCargado)
			objeto = objetoCargado
			
			objeto.position.x = -123
			objeto.position.y = 0
	else:
		objeto = null
#		print("Se anula el objeto")
	