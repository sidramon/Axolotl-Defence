extends PathFollow2D

signal damage(strength)
signal on_death(value)

var type
var speed = 0
var life = 0
var strength = 0
var value = 0

func _ready():
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
	life -= damage
	if life <= 0:
		on_destroy()
		
func on_destroy():
	emit_signal("on_death", value)
	self.queue_free()
