extends Node2D

var sound = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Quit_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_Sound_pressed():
	if sound:
		sound = false
		get_tree().get_node("Game").get_node("AudioStreamPlayer").Stop()
	else:
		sound = true
		get_tree().get_node("Game").get_node("AudioStreamPlayer").Play()
