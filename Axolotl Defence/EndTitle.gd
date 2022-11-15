extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if GameData.lastRound == 21:
		get_node("Decorations/GameOver").text = "You won!"
		GameData.lastRound = 20
		
	get_node("Round").text = "Round: " + String(GameData.lastRound)
	get_node("Score").text = "Score: " + String(GameData.score)

func _on_BackMenuButton_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()
