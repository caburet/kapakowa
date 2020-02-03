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


func _on_Button_pressed():
	get_tree().change_scene("res://prueba1.tscn")
	pass # Replace with function body.


func _on_Button2_pressed():
	$PantallaInicio.visible=false
	$Creditos.visible=true
	$Button.visible=false
	$Button2.visible=false
	$Button3.visible=false
	$Button4.visible=true
	$Creditos.play()
	pass # Replace with function body.


func _on_Button3_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Button4_pressed():
	$PantallaInicio.visible=true
	$Creditos.visible=false
	$Button.visible=true
	$Button2.visible=true
	$Button3.visible=true
	$Button4.visible=false
	pass # Replace with function body.
