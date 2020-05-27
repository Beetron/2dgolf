extends "res://World.gd"

var par = GlobalPlayerVars.par8

func change_level():
	get_tree().change_scene("res://Level I.tscn")
	return
