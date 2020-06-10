extends Node2D

export (NodePath) var TargetPath
export (float) var offset

onready var TargetNode = get_node(TargetPath)

func _process(delta):
	var ballPos = TargetNode.global_position
	var mousePos = get_global_mouse_position()
	
	self.global_position = offset * (ballPos - mousePos) + mousePos
	
	var potentialPower = ((ballPos - get_viewport().get_mouse_position()) * 8).abs()
	var powerThreshold = Vector2(5000,5000)
	if(potentialPower > powerThreshold):
		$Sprite.modulate = Color(1, 0, 0)	
	else:
		$Sprite.modulate = Color(1, 1, 1)
	return
