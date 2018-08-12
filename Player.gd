extends Area2D

export (int) var SPEED #How fast the player will move, Pixel/Seconds
var screensize #Size of the Game window
signal hit

func _ready():
	screensize = get_viewport_rect().size
	

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	#Modify the position Node variable to actually mode the Player.
	# We use clamp to prevent the player exiting the screen
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	flip_sprite(velocity)
	
	
	
	
func flip_sprite(velocity):
	if velocity.x != 0:
		$AnimatedSprite.animation =  "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
		
		
	
	
	
	
		