extends Node

onready var winLabel = $"Player/Ball/WinLabel"
onready var deadzoneLabel = $"Player/Ball/DeadzoneLabel"

var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_OutOfBounds_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Ball"):
		#deadzoneLabel.visible = true
		get_node("Player/Ball").outOfBounds = true
	return


func _on_Hole_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Ball"):
		#start timer
		get_node("ScoreCardTimer").start()
		#show scorecard
		get_node("Scorecard").visible = true
	return

func change_level():
	get_node("Player/Ball").shotCount = 0
	pass

func _on_ScoreCardTimer_timeout():
	change_level()
	return
