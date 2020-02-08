extends RigidBody2D

export var frictionSlowdown = 0.03
export var power = 3

var hitThreshold = 125 #Not sure how to get access to the edge of the ring directly

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		
		#Execute a hit if within the threshold of the ring
		if(self.global_position.distance_to(event.global_position) > hitThreshold):
			var hit = self.global_position - event.global_position
			apply_central_impulse(hit)
	return	

func _integrate_forces(state):
	#Apply friction
	state.apply_central_impulse(-state.linear_velocity * frictionSlowdown)
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
