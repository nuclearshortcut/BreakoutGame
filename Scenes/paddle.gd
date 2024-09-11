extends CharacterBody2D

var speed: int = 500;


func _physics_process(delta):
	move_and_collide(velocity)
	if Input.is_action_pressed("Left"):
		position.x += -1 * speed * delta;
		print("left")
	if Input.is_action_pressed("Right"):
		position.x += 1 * speed * delta;
		print("right")
	
	
