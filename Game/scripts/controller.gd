
extends Node

var turn = "white" setget toggle_turn

var who = null
var pieces = []
var pieces_cells = []

var pawn = null
var pawn_pos = null
var en_passant = false
onready var board = get_node("board")

func _ready():
	calc_pieces()

func toggle_turn():
	calc_pieces()
	if turn == "white":
		turn = "black"
	else:
		turn = "white"
func calc_pieces():
	pieces_cells.clear()
	pieces = get_node("player_white").get_children() + get_node("player_black").get_children()
	for piece in pieces:
		pieces_cells.append(board.world_to_map(piece.get_pos()))