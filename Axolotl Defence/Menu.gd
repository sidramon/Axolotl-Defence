extends Node2D

var easterTimes = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Start_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Settings_pressed():
	get_tree().change_scene("res://Settings.tscn")



func _on_leucistiqueButton_pressed():
	easterTimes += 1
	$Decorations/Leucistique/EasterSound.play()
	
	if easterTimes == 2:
		GameSettings.debugMode = true
		get_node("Decorations/Leucistique/AnimatedSprite").modulate = "e18383"


func _on_Quit_pressed():
	get_tree().quit()
