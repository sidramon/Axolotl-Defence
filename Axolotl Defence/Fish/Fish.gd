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
		
	move(delta)
	
func move(delta):
	set_offset(get_offset() + speed * delta)
	 
func on_hit(damage):
	timer.start()
	shader.set_shader_param("flash_modifier", 1)
	life -= damage
	if life <= 0:
		on_destroy()
		
func on_destroy():
	emit_signal("on_death", value)
	self.queue_free()


func _on_Timer_timeout():
	shader.set_shader_param("flash_modifier", 0);
	timer.stop();
