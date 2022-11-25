extends PathFollow2D

signal damage(strength)
signal on_death(value)

var sprite
var timer
var shader

var type
var speed = 0
var life = 0
var strength = 0
var value = 0

func _ready():
	self.add_to_group("pausable")
	sprite = get_node("KinematicBody2D/Sprite")
	timer = get_node("Timer")
	timer.set_wait_time(0.2)
	shader = sprite.get_material()
	
	type = self.editor_description
	speed = GameData.fish_data[type].speed
	life = GameData.fish_data[type].life
	strength = GameData.fish_data[type].strength
	value = GameData.fish_data[type].value

func _physics_process(delta):
	if unit_offset > 0.99:
		emit_signal("damage", strength)
		queue_free()
	
	if !GameSettings.onPause:
		move(delta)
	
func move(delta):
	set_offset(get_offset() + speed * delta)
	 
func on_hit(damage, type):
	timer.start()
	shader.set_shader_param("flash_modifier", 1)
	
	if self.type == "PufferFish" && type == "Axanthique":
		damage *= 1.15
	if self.type == "GrayFish" && (type == "Leucistique" || type == "Axanthique"):
		damage *= 0.7
	if self.type == "GrayFish" && type == "Copper":
		damage *= 1.25
	if self.type == "BossFish" && type == "Copper":
		damage *= 0.5
	if self.type == "BossFish" && type == "Leucistique":
		damage *= 0.85
	
	life -= damage
	
	if life <= 0:
		on_destroy()
		
func on_destroy():
	emit_signal("on_death", value)
	self.queue_free()


func _on_Timer_timeout():
	shader.set_shader_param("flash_modifier", 0);
	timer.stop();
