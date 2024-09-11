extends Node2D

var shot: bool = false; # If the ball has shot
var BALL_SPEED: int = 10000; # amount of wins
var end: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/Result/ResultText.visible = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !shot:
		$Ball.position = Vector2($Paddle.position.x, $Paddle.position.y - 51);
	if Input.is_action_pressed("Begin") and !shot:
		shot = true;
		$Ball.velocity.y -= 10;

	if Globals.LOSS == 3:
		$UI/Result/ResultText.visible = true;
		$UI/Result/ResultText.text = "YOU LOSE";
		if !end:
			end = true
			freeze_activity();
	if Globals.SCORE == 27:
		$UI/Result/ResultText.visible = true;
		$UI/Result/ResultText.text = "YOU WIN";
		if !end:
			end = true
			freeze_activity();

func _on_ball_killer_body_entered(body):
	if body.is_in_group("Ball"):
		shot = false;
		Globals.LOSS += 1;

func freeze_activity():
	$Paddle.speed = 0;
	$Ball.set_velocity(Vector2(0, 0));

	$ResetTimer.start()

func _on_reset_timer_timeout():
	end = false;
	Globals.SCORE = 0;
	Globals.LOSS = 0;
	get_tree().reload_current_scene()
	
#	$UI/Result/ResultText.visible = false;
#	$Paddle.speed = 500;
#	$Ball.set_velocity(Vector2(300, 300));
#	$Paddle.set_position(Vector2(574, 560));
#	shot = false;
#	print("Ya")
