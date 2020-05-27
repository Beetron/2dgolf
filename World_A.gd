extends "res://World.gd"

var par = GlobalPlayerVars.par1

func change_level():
	get_tree().change_scene("res://Level B.tscn")
	return
