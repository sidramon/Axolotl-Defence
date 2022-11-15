extends Node2D

func _on_Quit_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_Sound_pressed():
	if GameSettings.sound:
		GameSettings.sound = false
		$AudioStreamPlayer.playing = false
	else:
		GameSettings.sound = true
		$AudioStreamPlayer.playing = true


func _on_Restart_pressed():
	get_tree().change_scene("res://Game.tscn")

