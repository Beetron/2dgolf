extends Label

func _ready():
	var textVal = GlobalPlayerVars.par8 as String
	text = " "+textVal+" "
	return
