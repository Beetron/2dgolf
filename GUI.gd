extends MarginContainer

var par : String

func _ready():
	get_node("HBoxContainer/Par").text = "Par: " + get_node("/root/Main/World").par as String
	return
	
func _on_Ball_shotCountChanged(shotCount):
	get_node("HBoxContainer/Shot Count").changeShotCount(shotCount)
	return
