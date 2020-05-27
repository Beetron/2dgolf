extends Label

func _ready():
	var textVal = GlobalPlayerVars.par9 as String
	text = " "+textVal+" "
	return
