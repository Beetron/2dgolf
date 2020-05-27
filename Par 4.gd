extends Label

func _ready():
	var textVal = GlobalPlayerVars.par4 as String
	text = " "+textVal+" "
	return
