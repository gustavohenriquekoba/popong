class_name Ball extends CharacterBody2D

var speed = 320
var max_speed = 500

func _ready():
	randomize()
	velocity.y = [-1, 1][randi() % 2]
	velocity.x = [-1, 1][randi() % 2]
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		speed += 5

	if speed > max_speed:
		speed = max_speed

func ball_stop():
	speed = 0

func ball_restart():
	speed = 320
	velocity.y = [-1, 1][randi() % 2]
	velocity.x = [-1, 1][randi() % 2]
