extends "res://World.gd"

var par = GlobalPlayerVars.par6

func change_level():
	get_tree().change_scene("res://Level G.tscn")
	return
