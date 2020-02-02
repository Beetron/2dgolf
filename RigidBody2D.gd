extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var offset = Vector2(0, 0)
var hitForce = Vector2(300, 0)
var frictionSlowdown = 0.03


# Called when the node enters the scene tree for the first time.
func _ready():
	
	return # Replace with function body.
	
	
func _input(event):
	#if event.is_action_pressed("jump"):
	if event is InputEventMouseButton:
		apply_impulse(offset, hitForce)
	return


func _integrate_forces(state):
	#Apply friction
	state.apply_central_impulse(-state.linear_velocity * frictionSlowdown)
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
