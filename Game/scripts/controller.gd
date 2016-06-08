
extends Node

var turn = "white" setget toggle_turn
var who = null
var pieces = []
var pieces_cells = []
onready var board = get_node("board")

func _ready():
	calc_pieces()

func toggle_turn():
	if turn == "white":
		turn = "black"
	else:
		turn = "white"
	calc_pieces()
func calc_pieces():
	pieces_cells.clear()
	pieces = get_node("player_white").get_children() + get_node("player_black").get_children()
	for piece in pieces:
		pieces_cells.append(board.world_to_map(piece.get_pos()))