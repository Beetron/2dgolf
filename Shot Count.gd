extends Label

func _ready():
	text = "Shot Count: 0"
	return

func changeShotCount(shotCount):
	text = "Shot Count: " + shotCount as String
	return
