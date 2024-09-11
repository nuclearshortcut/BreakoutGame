extends CanvasLayer

func _ready():
	Globals.connect("score_change", _update_score_text);

func _process(delta):
	pass

func _update_score_text():
	$ScoreCounter/HBoxContainer/Score.text = str(Globals.SCORE);
