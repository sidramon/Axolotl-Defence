extends Node2D

const leucistiqueCost = 5
const axanthiqueCost = 8
const copperCost = 10
const melaniqueCost = 12

var map_node

var sound = true
var build_mode = false
var build_valid = false
var build_location
var build_type

var life = 20
var money = 100
var current_round = 0
var fishes_in_round = 0

func _ready():
	map_node = get_node("Map")
	get_node("Labels/Money").text = String(money)
	get_node("Labels/Life").text = String(life)
	
	$AudioStreamPlayer.play(0)
	
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", self, "initiate_build_mode", [i.get_name()])
	next_round()
		
func _process(delta):
	if build_mode:
		update_tower_preview()
		
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
	
	
	if build_type == "Leucistique" && money - leucistiqueCost >= 0:
		cost = 5;
	elif build_type == "Axanthique" && money - axanthiqueCost >= 0:
		cost = 8;
	elif build_type == "Copper" && money - copperCost >= 0:
		cost = 10;
	elif build_type == "Mélanique" && money - melaniqueCost >= 0:
		cost = 12;
	else:
		ok = false
		
	if build_valid && ok:
		money -= cost
		get_node("Labels/Money").text = String(money)
		var new_tower = load("res://Axolotls/" + build_type + ".tscn").instance()
		new_tower.position = build_location
		map_node.add_child(new_tower, true)
		
func _on_SettingsButton_pressed():
	get_node("InGameSettings").visible = !get_node("InGameSettings").visible;


func _on_Quit_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_Sound_pressed():
	if sound:
		sound = false
		get_node("InGameSettings/Sound").modulate = "e18383"
		$AudioStreamPlayer.playing = false
	else:
		sound = true
		get_node("InGameSettings/Sound").modulate = "ffffff"
		$AudioStreamPlayer.playing = true
		
func disabledButtons():
	var state  = get_node("Buttons/Axanthique").disabled
	
	get_node("Buttons/Axanthique").disabled = !state
	get_node("Buttons/Leucistique").disabled = !state
	get_node("Buttons/Mélanique").disabled = !state
	get_node("Buttons/Copper").disabled = !state

func next_round():
	var round_data = retrieve_wave_data()
	yield(get_tree().create_timer(0.5), "timeout")
	spawn_fishes(round_data)
	
func retrieve_wave_data():
	var round_data = [["RedFish", 1.0], ["RedFish", 0.6], ["BlueFish", 0.1], ["GreenFish", 0.0]]
	current_round += 1
	get_node("Labels/Round").text = "Round " + String(current_round)
	fishes_in_round = round_data.size()
	return round_data
	
func spawn_fishes(round_data):
	for i in round_data:
		var new_fish = load("res://Fish/" + i[0] + ".tscn").instance()
		new_fish.connect("damage", self, "on_damage")
		map_node.get_node("Path").add_child(new_fish, true)
		yield(get_tree().create_timer(i[1]), "timeout")
	
func on_damage(damage):
	life -= damage
	get_node("Labels/Life").text = String(life)
