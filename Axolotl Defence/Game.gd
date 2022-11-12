extends Node2D

var map_node

var build_mode = false
var build_valid = false
var build_location
var build_type

var life = 20
var money = 8
var current_round = 0
var fishes_in_round = 0

func _ready():
	map_node = get_node("Map")
	get_node("Labels/Money").text = String(money)
	get_node("Labels/Life").text = String(life)
	
	if GameSettings.sound:
	 $AudioStreamPlayer.play(0)
	
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", self, "initiate_build_mode", [i.get_name()])
	next_round()
		
func _process(delta):
	if build_mode:
		update_tower_preview()
	if fishes_in_round == 0:
		next_round()
		
func _unhandled_input(event):
	if event.is_action_released("ui_cancel") and build_mode == true:
		cancel_build_mode()
		disabledButtons()
		
	if event.is_action_released("ui_accept") and build_mode == true:
		verify_and_build()
		cancel_build_mode()
		disabledButtons()
	
func initiate_build_mode(axolotl_type):
	build_type = axolotl_type
	build_mode = true
	disabledButtons()
	get_node("UI").set_tower_preview(axolotl_type, get_global_mouse_position())

func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var current_tile = map_node.get_node("PathMap").world_to_map(mouse_position)
	var tile_position = map_node.get_node("PathMap").world_to_map(current_tile)
	
	if map_node.get_node("PathMap").get_cellv(current_tile) == -1 && mouse_position.x < 1088:
		get_node("UI").update_tower_preview(mouse_position, "ffffff")
		build_valid = true
		build_location = mouse_position
	else:
		get_node("UI").update_tower_preview(mouse_position, "942a2a")
		build_valid = false
		
func cancel_build_mode():
	build_mode = false
	build_valid = false
	get_node("UI/TowerPreview").queue_free()
		
func verify_and_build():
	var ok = true
	var cost
	
	
	if money - GameData.tower_data[build_type].cost < 0:
		ok = false
		
	if build_valid && ok:
		money -= GameData.tower_data[build_type].cost
		get_node("Labels/Money").text = String(money)
		var new_tower = load("res://Axolotls/" + build_type + ".tscn").instance()
		new_tower.ready = true
		new_tower.position = build_location
		map_node.add_child(new_tower, true)
		
func _on_SettingsButton_pressed():
	get_node("InGameSettings").visible = !get_node("InGameSettings").visible;

func _on_Quit_pressed():
	get_tree().change_scene("res://Menu.tscn")

func _on_Sound_pressed():
	if GameSettings.sound:
		GameSettings.sound = false
		$AudioStreamPlayer.playing = false
	else:
		GameSettings.sound = true
		$AudioStreamPlayer.playing = true
		
func disabledButtons():
	var state  = get_node("Buttons/Axanthique").disabled
	
	get_node("Buttons/Axanthique").disabled = !state
	get_node("Buttons/Leucistique").disabled = !state
	get_node("Buttons/Melanique").disabled = !state
	get_node("Buttons/Copper").disabled = !state

func next_round():
	var round_data = retrieve_wave_data()
	yield(get_tree().create_timer(2.5), "timeout")
	spawn_fishes(round_data)
	
func retrieve_wave_data():
	var round_data = GameData.rounds[current_round]
	current_round += 1
	get_node("Labels/Round").text = "Round " + String(current_round)
	fishes_in_round = round_data.size()
	return round_data
	
func spawn_fishes(round_data):
	for i in round_data:
		var new_fish = load("res://Fish/" + i[0] + ".tscn").instance()
		new_fish.connect("damage", self, "on_damage")
		new_fish.connect("on_death", self, "on_death")
		map_node.get_node("Path").add_child(new_fish, true)
		yield(get_tree().create_timer(i[1]), "timeout")
	
func on_damage(damage):
	fishes_in_round -= 1
	life -= damage
	get_node("Labels/Life").text = String(life)
	if life <= 0:
		get_tree().change_scene("res://EndTitle.tscn")

func on_death(value):
	fishes_in_round -= 1
	money += value
	get_node("Labels/Money").text = String(money)


func _on_Game_tree_exiting():
	Engine.set_time_scale(1.0)
