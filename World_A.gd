extends "res://World.gd"

export var par = 7

func change_level():
	get_tree().change_scene("res://Level B.tscn")
	return
