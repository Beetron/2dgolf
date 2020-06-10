extends Node

onready var winLabel = $"Player/Ball/WinLabel"
onready var deadzoneLabel = $"Player/Ball/DeadzoneLabel"

var timer
var ballInHole = false
var shotMarkerScene = preload("res://ShotMarker.tscn")
var shotMarkerList = []

# Called when the node enters the scene tree for the first time.
func _ready():
	createShotMarkers()
	get_node("Player/Ball").connect("showShotMarkers", self, "_on_Ball_showShotMarkers")
	get_node("Player/Ball").connect("hideShotMarkers", self, "_on_Ball_hideShotMarkers")
	return

func _on_OutOfBounds_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Ball"):
		#deadzoneLabel.visible = true
		get_node("Player/Ball").outOfBounds = true
	return


func _on_Hole_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Ball" and ballInHole == false):
		ballInHole = true #So we don't count an accidental double collision as two shots
		GlobalPlayerVars.shots.append((get_node("Player/Ball").shotCount))
		#start timer
		get_node("ScoreCardTimer").start()
		#show scorecard
		get_node("Scorecard").updateScorecard()
		get_node("Scorecard").visible = true
	return
	
func createShotMarkers():
	var ballPath = get_node("Player/Ball").get_path()
	for n in range(10):
		var shotNode = shotMarkerScene.instance()
		shotNode.TargetPath = ballPath
		shotNode.offset = (n+1) / 10 as float
		shotNode.visible = false
		add_child(shotNode)
		shotMarkerList.append(shotNode.get_name())
	return
	
func _on_Ball_showShotMarkers():
	for n in shotMarkerList:
		get_node(n).visible = true
	return


func _on_Ball_hideShotMarkers():
	for n in shotMarkerList:
		get_node(n).visible = false
	return


func change_level():
	pass

func _on_ScoreCardTimer_timeout():
	change_level()
	return
