extends "res://World.gd"

var par = GlobalPlayerVars.par2

func change_level():
	get_tree().change_scene("res://Level C.tscn")
	return
