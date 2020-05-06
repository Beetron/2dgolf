extends Label

func _ready():
	text = "Par: " + get_node("/root/Main/World").par as String
	return
