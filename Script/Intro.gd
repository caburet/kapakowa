extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Animintro")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressedasa():
	print("_on_Button_pressed()")
	globals.numberplayers= self.text
	get_tree().change_scene("res://Scenes/game.tscn")
	pass # Replace with function body.



func _on_Salir_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Button4_pressed():
	$PantallaInicio.visible=true
	$Creditos.visible=false
	$Pj.hide()
	$Button4.visible=false
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	$Pj.hide()
	$PantallaInicio.show()
	pass # Replace with function body.


func _on_Creditos2_pressed():
	$PantallaInicio.visible=false
	$Creditos.visible=true
	$Button4.visible=true
	$Creditos.play()	
	pass # Replace with function body.


func _on_Start_pressed():
	$PantallaInicio/PopupMenu.show()
	

	pass # Replace with function body.


func _on_Button_pressed(extra_arg_0):
	print("_on_Button_pressed()")
	globals.numberplayers=extra_arg_0
	get_tree().change_scene("res://Scenes/game.tscn")
	pass # Replace with function body.
