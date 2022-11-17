extends Node2D

func _ready():
	if !GameSettings.sound:
		get_node("Sound").pressed = true

func _on_Quit_pressed():
	get_tree().change_scene("res://Menu.tscn")

func _on_Restart_pressed():
	get_tree().change_scene("res://Game.tscn")

