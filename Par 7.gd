extends Label

func _ready():
	var textVal = GlobalPlayerVars.par7 as String
	text = " "+textVal+" "
	return
