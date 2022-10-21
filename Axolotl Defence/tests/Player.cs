using Godot;
using System;

public class Player : KinematicBody2D
{
	const int MAXSPEED = 100;
	const int ACCEL = 10;
	
	bool facing_right = false;
	
	Vector2 motion = new Vector2();
	
	AnimatedSprite currentSprite;

	public override void _Ready()
	{
		currentSprite = GetNode<AnimatedSprite>("AnimatedSprite");
	}

	public override void _PhysicsProcess(float delta)
	{		
		if (facing_right) {
			currentSprite.FlipH = false;
		} else {
			currentSprite.FlipH = true;
		}
		
		motion.x = motion.Clamped(MAXSPEED).x;
		motion.y = motion.Clamped(MAXSPEED).y;
		
		if (Input.IsActionPressed("ui_left")) {
			motion.x -= ACCEL;
			facing_right = true;
			currentSprite.Play("Swimming");
		} else if (Input.IsActionPressed("ui_right")) {
			motion.x += ACCEL;
			facing_right = false;
			currentSprite.Play("Swimming");
		} else if (Input.IsActionPressed("ui_up")) {
			motion.y -= ACCEL;
			currentSprite.Play("Swimming");
		} else if (Input.IsActionPressed("ui_down")) {
			motion.y += ACCEL;
			currentSprite.Play("Swimming");
		} else {
			motion = motion.LinearInterpolate(Vector2.Zero, 0.2f);
			currentSprite.Play("Idle");
		}
		
		motion = MoveAndSlide(motion);
	}
}
