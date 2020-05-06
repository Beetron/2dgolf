extends Label

var labelShotCount = 0

func _ready():
	text = "Shot Count: " + labelShotCount as String
	pass # Replace with function body.

func _on_Ball_shotCountChanged(shotCount):
	text = "Shot Count: " + shotCount as String
	return
