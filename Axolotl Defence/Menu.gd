extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Start_pressed():
	get_tree().change_scene("res://Map.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://Credits.tscn")


func _on_Settings_pressed():
	get_tree().change_scene("res://Settings.tscn")
