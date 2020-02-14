extends RigidBody2D

export var frictionSlowdown = 0.03
export var power = 3
onready var ring = $"Control Ring"

var hitThreshold = 125 #Not sure how to get access to the edge of the ring directly

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT):	
		if (event.pressed):
			#Hide/Show control ring if mouse is pressed
			ring.visible = true
		else:
			#Execute a hit if within the threshold of the ring
			if (self.global_position.distance_to(event.global_position) > hitThreshold):
				var hit = (self.global_position - event.global_position) * power
				apply_central_impulse(hit)
				ring.visible = false
	return

func _integrate_forces(state):
	#Apply friction
	state.apply_central_impulse(-state.linear_velocity * frictionSlowdown)
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Modulate transparency based on distance to ball
	var distance = self.global_position.distance_to(get_viewport().get_mouse_position())
	ring.modulate.a = distance / hitThreshold
	pass
