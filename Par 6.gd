extends Label

func _ready():
	var textVal = GlobalPlayerVars.par6 as String
	text = " "+textVal+" "
	return
