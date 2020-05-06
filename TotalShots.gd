extends Label

func _ready():
	text = "Total Shots:" + GlobalPlayerVars.totalScore as String
	return

func updateTotalCount():
	text = "Total Shots: " + GlobalPlayerVars.totalScore as String
	return
