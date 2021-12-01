extends Sprite

var angular_speed = PI
export var speed = 200.0
export var turnMod = 200.0
export var maxDirection = 1.5
export var directionDelta = 0.075
var direction =  0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = 0.0
	
	
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		direction -= directionDelta
		if direction < (-1.0 * maxDirection): 
			direction = (-1.0 * maxDirection)
	else:
		if Input.is_action_pressed("ui_right"):
			direction += directionDelta
			if direction > maxDirection: 
				direction = maxDirection
		else:
			if direction > 0:
				direction -= directionDelta
				if direction < 0:
						direction = 0
			else:
				if direction < 0:
					direction += directionDelta
					if direction > 0:
						direction = 0

	rotation += angular_speed * direction * delta * (speed / 200.0)
	var velocity = Vector2.UP.rotated(rotation) * speed
	position +=  velocity * delta
