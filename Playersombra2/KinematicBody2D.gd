extends KinematicBody2D


#--------------------MOVIMIENTO EN 8 SENTIDOS-----------------------------
export (String) var color = "blue"

export (int) var speed = 200

var objeto = null

var velocity = Vector2()

func _ready():
	self.z_index = 3

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$animacion.play()
#		$animacion.animation = "caminar"
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
#		$AnimatedSprite.animation = "caminar"

	if Input.is_action_pressed('ui_down'):
		        velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
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
	

#------------------ROTACION + MOVIMIENTO-----------------------------------

#export (int) var speed = 200                 #velocidad de movmiento
#export (float) var rotation_speed = 10       #velocidad de giro
#
#var velocity = Vector2()
#var rotation_dir = 0
#
#func get_input():
#	rotation_dir = 0
#	velocity = Vector2()
#
#	if Input.is_action_pressed('ui_right'):
#		rotation_dir += 1
#
#	if Input.is_action_pressed('ui_left'):
#		 rotation_dir -= 1
#
#	if Input.is_action_pressed('ui_down'):
#		velocity = Vector2(-speed, 0).rotated(rotation)
#
#	if Input.is_action_pressed('ui_up'):
#		velocity = Vector2(speed, 0).rotated(rotation)
#
#func _physics_process(delta):
#	    get_input()
#	    rotation += rotation_dir * rotation_speed * delta
#	    velocity = move_and_slide(velocity)
#	    print(rotation)

#-------------------------------------------------------------------------------------
#
#func get_input():
#	if Input.is_action_pressed('click'):
#		look_at(get_global_mouse_position())
#	velocity = Vector2()
#	if Input.is_action_pressed('ui_down'):
#		        velocity = Vector2(-speed, 0).rotated(rotation)
#	if Input.is_action_pressed('ui_up'):
#		        velocity = Vector2(speed, 0).rotated(rotation)
#
#func _physics_process(delta):
#	    get_input()
#	    velocity = move_and_slide(velocity)
#
#---------------------MOVER CON CLICK---------------------------------------
##
#var target = Vector2(320,480)
#
#func _input(event):
#	if event.is_action_pressed('click') or InputEventScreenTouch:
#		target = get_global_mouse_position()
#
#func _physics_process(delta):
##	look_at(target)
##	print(position.distance_to(target))
#
#	if position.distance_to(target) > 5:
#		velocity = position.direction_to(target) * (speed)
#		velocity = move_and_slide(velocity)
##	elif position.distance_to(target) > 25:
##		velocity = position.direction_to(target) * speed
##		velocity = move_and_slide(velocity)

