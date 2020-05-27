extends Label

func _ready():
	var textVal = GlobalPlayerVars.par2 as String
	text = " "+textVal+" "
	return
