extends CanvasLayer

func set_tower_preview(tower_type, mouse_position):
	var drag_tower = load("res://Axolotls/Animated/" + tower_type + "Animated.tscn").instance()
	drag_tower.set_name("DragTower")
	
	var range_texture = Sprite.new()
	var scaling = GameData.tower_data[tower_type].range / 300.0
	range_texture.scale = Vector2(scaling, scaling)
	var texture = load("res://Assets/range_overlay.png")
	range_texture.texture = texture
	
	var control = Control.new()
	control.add_child(drag_tower, true)
	control.add_child(range_texture, true)
	control.rect_position = mouse_position
	control.set_name("TowerPreview")
	add_child(control, true)
	move_child(get_node("TowerPreview"), 0)

func update_tower_preview(new_position, color):
	get_node("TowerPreview").rect_position = new_position
	if get_node("TowerPreview/DragTower").modulate != Color(color):
		get_node("TowerPreview/DragTower").modulate = Color(color)
		get_node("TowerPreview/Sprite").modulate = Color(color)


func _on_PausePlayButton_pressed():
	pass

func _on_SpeedUp_pressed():
	if Engine.get_time_scale() == 2.0:
		Engine.set_time_scale(1.0)
	else:
		Engine.set_time_scale(2.0)
