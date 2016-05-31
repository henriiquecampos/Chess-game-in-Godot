
extends Node

var turn = "white" setget toggle_turn

func toggle_turn():
	if turn == "white":
		turn = "black"
	else:
		turn = "white"
	print("changing turn")