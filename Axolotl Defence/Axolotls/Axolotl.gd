extends Node2D

var enemy_array = []
var enemy

func _ready():
	pass

func _physics_process(delta):
	if (enemy_array.size() != 0):
		select_enemy()
		turn()
	else:
		enemy = null
	
func turn():
	if enemy.position.x > self.position.x:
		get_node("AnimatedSprite").set_flip_h(true)
	else:
		get_node("AnimatedSprite").set_flip_h(false)
	
func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.offset)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]

func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())

func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())