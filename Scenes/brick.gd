extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	print("collision")
	if body.is_in_group("Ball"):
		Globals.SCORE += 1;
		queue_free()

