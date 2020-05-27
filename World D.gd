extends "res://World.gd"

var par = GlobalPlayerVars.par4

func change_level():
	get_tree().change_scene("res://Level E.tscn")
	return
