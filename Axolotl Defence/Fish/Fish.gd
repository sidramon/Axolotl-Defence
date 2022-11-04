extends PathFollow2D

signal damage(strength)

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
	 
