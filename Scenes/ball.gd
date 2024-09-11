extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_velocity(Vector2(300, 300))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
