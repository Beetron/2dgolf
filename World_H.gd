extends "res://World.gd"

export var par = 0

func change_level():
	get_tree().change_scene("res://Level I.tscn")
	return
