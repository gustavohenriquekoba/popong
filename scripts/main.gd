extends Node

var P1Score = 0
var P2Score = 0

func _ready():
	_default_positions()

func _default_positions():
	$Paddle_Player.position = Vector2(0, 0)
	$Paddle_Player2.position = Vector2(1152, 0)
	$Ball.position = Vector2(640, 384)

func _on_goal_p_1_body_entered(body):
	if body is Ball:
		_p2_scored()
		$CounterTimer.start()

func _on_goal_p_2_body_entered(body):
	if body is Ball:
		_p1_scored()
		$CounterTimer.start()

func _process(delta):
	$P1Score.text = str(P1Score)
	$P2Score.text = str(P2Score)
	$CounterTimerLabel.text = str(int($CounterTimer.time_left) + 1)

func _on_counter_timer_timeout():
	get_tree().call_group("BallGroup", "ball_restart")
	$CounterTimerLabel.visible = false
	
func _p1_scored():
		$Ball.position = Vector2(640, 384)
		$CounterTimerLabel.visible = true
		P1Score += 1
		get_tree().call_group("BallGroup", "ball_stop")
		
func _p2_scored():
		$Ball.position = Vector2(640, 384)
		$CounterTimerLabel.visible = true
		P2Score += 1
		get_tree().call_group("BallGroup", "ball_stop")
