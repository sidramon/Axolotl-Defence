extends Node2D

signal onShoot(projectile)

var type
var	damage
var rof
var rangeAttack
var test = Vector2()
var enemy_array = []
var enemy
var ready = false

var projectilePath = preload("res://Projectile.tscn")

func _ready():
	test = position
	self.add_to_group("pausable")
	type = self.editor_description
	damage = GameData.tower_data[type].damage
	rof = GameData.tower_data[type].rof
	rangeAttack = GameData.tower_data[type].range
	self.get_node("Range/CollisionShape2D").shape.set_radius(rangeAttack)

func _physics_process(delta):
	if (enemy_array.size() != 0):
		select_enemy()
		turn()
		if ready && !GameSettings.onPause:
			attack()
			if GameSettings.sound:
				$AttackSound.play()
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

func attack():
	var attack = projectilePath.instance()
	var t = position.y
	attack.position = position
	attack.velocity = enemy.position - position
	attack.endLife = enemy.position
	attack.color = GameData.tower_data[type].color
	emit_signal("onShoot", attack)
	ready = false
	enemy.on_hit(damage, type)
	yield(get_tree().create_timer(rof), "timeout")
	ready = true
	
func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())

func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())
