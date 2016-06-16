
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
	en_passant()
func calc_pieces():
	pieces_cells.clear()
	pieces = get_node("player_white").get_children() + get_node("player_black").get_children()
	for piece in pieces:
		pieces_cells.append(board.world_to_map(piece.get_pos()))
func en_passant():
	if pawn != null and pawn.is_in_group(turn):
		print("cleanning")
		pawn = null
		pawn_pos = null
		en_passant = false
	elif pawn == null:
		en_passant = false
		print("Cannot Passant")
	else:
		en_passant = true
		print("Can En Passant")