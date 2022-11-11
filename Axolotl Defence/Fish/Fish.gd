extends PathFollow2D

signal damage(strength)
signal on_death(strength)

var speed = 0
var life = 0
var strength = 0

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
	emit_signal("on_death", strength)
	self.queue_free()
