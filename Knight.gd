extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 180
const GRAVITY = 15
const JUMPFORCE = -350
const CROUCH_SPEED = 100

func _physics_process(delta):
	# Move Right (+x)
	if Input.is_action_pressed("D_Key"):
		velocity.x = SPEED
		$Sprite.play("Running")
		
	# Move Left (-x)
	elif Input.is_action_pressed("A_Key"):
		velocity.x = -SPEED
		$Sprite.play("Running")
		
	else:
		$Sprite.play("Idle")
	
	if not is_on_floor() and velocity.y < 0:
		$Sprite.play("Jump")
		
	if not is_on_floor() and velocity.y > 0:
		$Sprite.play("Falling")
		
	#Falling Speed Increase by Time
	velocity.y = velocity.y + GRAVITY
		
	#Jump
	if Input.is_action_just_pressed("Space_Key"):# and is_on_floor():
		velocity.y = JUMPFORCE
		
	velocity = move_and_slide(velocity,Vector2.UP)
	#Slide After Releasing Move Keys
	velocity.x = lerp(velocity.x,0,0.5)

func _on_crouch():
	pass



