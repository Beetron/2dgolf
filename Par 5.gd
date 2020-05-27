extends Label

func _ready():
	var textVal = GlobalPlayerVars.par5 as String
	text = " "+textVal+" "
	return
