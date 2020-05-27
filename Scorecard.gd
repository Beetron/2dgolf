extends Control

func _ready():
	pass
	
func updateScorecard():
	var count = 1
	for i in GlobalPlayerVars.shots:
		get_node("PanelContainer/GridContainer/Shots "+count as String).text = i as String
		count += 1
	
	get_node("PanelContainer/GridContainer/Total Shots").text = GlobalPlayerVars.totalScore as String
	return
