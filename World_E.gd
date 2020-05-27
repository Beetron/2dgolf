extends "res://World.gd"

var par = GlobalPlayerVars.par5

func change_level():
	get_tree().change_scene("res://Level F.tscn")
	return
