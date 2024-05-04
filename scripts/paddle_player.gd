class_name P1_PADDLE extends CharacterBody2D

const SPEED = 500

func _physics_process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("P1_UP"):
		direction.y -= 1
		
	elif Input.is_action_pressed("P1_DOWN"):
		direction.y += 1
		
	move_and_collide(direction * SPEED * delta)
