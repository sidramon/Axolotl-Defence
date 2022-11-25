extends KinematicBody2D

var velocity = Vector2(0, 0)
var speed = 3000
var endLife = Vector2(0, 0)
var color = "FFFFFF"

func _physics_process(delta):
	if color != "FFFFFF":
		self.modulate = Color(color)
	move_and_collide(velocity.normalized() * delta * speed)
	if position == endLife:
		self.queue_free()
