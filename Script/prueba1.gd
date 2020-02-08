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
	if seg >= 60:
		get_tree().change_scene("res://Scenes/fin.tscn")
	seg += 1
	$Label.text= str(60 - seg)
	pass # Replace with function body.


func _on_Timer_luces_timeout():
	var random= randi()%11+1
	if randi()%11+1<random:
		$LucesMapa/Light2D2.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D3.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D4.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D5.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D6.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D7.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D8.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D9.hide()
	if randi()%11+1<random:
		$LucesMapa/Light2D10.hide()
	$LucesMapa/Timer_luces_on.start()
	pass # Replace with function body.


func _on_Timer_luces_on_timeout():
	$LucesMapa/Light2D2.show()
	$LucesMapa/Light2D3.show()
	$LucesMapa/Light2D4.show()
	$LucesMapa/Light2D5.show()
	$LucesMapa/Light2D6.show()
	$LucesMapa/Light2D7.show()
	$LucesMapa/Light2D8.show()
	$LucesMapa/Light2D9.show()
	$LucesMapa/Light2D10.show()
	$LucesMapa/Timer_luces_on.stop()
	pass # Replace with function body.
