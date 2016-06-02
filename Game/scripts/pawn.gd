
extends Sprite

export var which_piece = "Piece"
onready var base = get_node("base_piece")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func calc_cell_white(piece):
	base.parent_cell = base.board.world_to_map(base.parent.get_pos())
	#Checks if is selected and calc the movement according
	#to the type of cell being selected
	if base.is_selected:
		#Calculation for the pawn piece
		if piece == "pawn":
			print("calculating pawn_white")
			if base.already_moved:
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -1))
			else:
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -1))
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -2))
				base.already_moved = true
####################################################

func calc_cell_black(piece):
	base.parent_cell = base.board.world_to_map(base.parent.get_pos())
	#Checks if is selected and calc the movement according
	#to the type of cell being selected
	if base.is_selected:
		#Calculation for the pawn piece
		if piece == "pawn":
			print("calculating pawn_black")
			if base.already_moved:
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y +1))
			else:
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y +1))
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y +2))
				base.already_moved = true


func _on_pawn_exit_tree():
	print("HEY i WAS CAPTURED!")
