extends KinematicBody2D

var motion = Vector2()
var speed = 2.6

func _physics_process(delta):
	# Move Right +x
	if Input.is_action_pressed("ui_right"):
		position.x += speed

	# Move Left -x
	if Input.is_action_pressed("ui_left"):
		position.x -= speed
	
	# Move Up -y
	if Input.is_action_pressed("ui_up"):
		position.y -= speed
	
	# Move Down +y
	if Input.is_action_pressed("ui_down"):
		position.y += speed
		
	pass
