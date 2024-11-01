extends "res://PlayerMovement.gd"

func move_player(dir):
	if dir in inputs:
		position += inputs[dir] * tile_size
	else:
		print("Invalid direction:", dir)
