extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_pressed('joystick_prueba_0'):
		print("jugador 0")
		
	if Input.is_action_pressed('joystick_prueba_1'):
		print("jugador 1")