extends Label

func _ready():
	var textVal = GlobalPlayerVars.par3 as String
	text = " "+textVal+" "
	return
