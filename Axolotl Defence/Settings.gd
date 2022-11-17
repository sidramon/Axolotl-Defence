extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if !GameSettings.sound:
		get_node("SoundSettings").pressed = true
	if GameSettings.debugMode:
		get_node("DebugButton").pressed = true


func _on_Back_pressed():
	get_tree().change_scene("res://Menu.tscn")




func _on_SoundSettings_pressed():
	GameSettings.sound = !GameSettings.sound


func _on_DebugButton_pressed():
	GameSettings.debugMode = $DebugButton.pressed
