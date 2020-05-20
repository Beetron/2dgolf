extends "res://World.gd"

export var par = 0

func change_level():
	#game over
	get_tree().change_scene("res://Game Over.tscn")
	return
