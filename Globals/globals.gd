extends Node

signal score_change
signal loss_change

var SCORE: int = 0:
	set(value):
		SCORE = value;
		emit_signal("score_change");
		#score_change.emit()
	get:
		return SCORE;

var LOSS: int = 0:
	set(value):
		LOSS = value;
		emit_signal("loss_change");
		#loss_change.emit()
	get:
		return LOSS;
