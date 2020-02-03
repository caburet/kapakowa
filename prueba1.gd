extends Control

# Declare member variables here. Examples:
# var a = 2
var seg = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if seg >= 30:
		
		get_tree().change_scene("res://fin.tscn")
	seg += 1
	$Label.text= str(30 - seg)
	pass # Replace with function body.
