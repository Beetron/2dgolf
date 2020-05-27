extends "res://World.gd"

var par = GlobalPlayerVars.par3

func change_level():
	get_tree().change_scene("res://Level D.tscn")
	return
