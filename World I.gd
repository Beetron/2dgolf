extends "res://World.gd"

var par = GlobalPlayerVars.par9

func change_level():
	#game over
	get_tree().change_scene("res://Game Over.tscn")
	return
