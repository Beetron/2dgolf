extends Label

func _ready():
	var textVal = GlobalPlayerVars.par1 as String
	text = " "+textVal+" "
	return
