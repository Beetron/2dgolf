extends RigidBody2D

export var frictionSlowdown = 0.03
export var power = 8
signal shotCountChanged
onready var ring = $"Control Ring"
var shotCount = 0

var hitThreshold = 125 #Not sure how to get access to the edge of the ring directly
var stopThreshold = Vector2(1,1) #To test whether the ball has stopped
var lastPos
var readyToHit = false
var outOfBounds = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#Initialize lastPos with current position
	pass # Replace with function body.

func _input(event):
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT):	
		if(readyToHit == true):
			if (event.pressed):
				#Hide/Show control ring if mouse is pressed
				ring.visible = true
			else:
				#Execute a hit if within the threshold of the ring
				if (self.global_position.distance_to(event.position) > hitThreshold && ring.visible == true):
					var hit = (self.global_position - event.position) * power
					apply_central_impulse(hit)
					readyToHit = false
					ring.visible = false
					shotCount += 1
					emit_signal("shotCountChanged", shotCount)
	return

func _integrate_forces(state):
	#Apply friction
	state.apply_central_impulse(-state.linear_velocity * frictionSlowdown)
	
	#Ball has come to a stop
	if(state.linear_velocity.abs() < stopThreshold && readyToHit == false):
		lastPos = state.get_transform()
		readyToHit = true
		
	#Handle out of bounds reset
	if(outOfBounds == true):
		#state.set_transform()  ,(lastPos)
		state.set_transform(lastPos)
		outOfBounds = false
		state.linear_velocity = Vector2(0,0)
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Modulate transparency based on distance to ball
	var distance = self.global_position.distance_to(get_viewport().get_mouse_position())
	ring.modulate.a = distance / hitThreshold
	return
