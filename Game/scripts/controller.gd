
extends Node

var turn = "white" setget toggle_turn
var who = null

func toggle_turn():
	if turn == "white":
		turn = "black"
	else:
		turn = "white"