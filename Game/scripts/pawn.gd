
extends Sprite

#Base piece acess variables
export var which_piece = "Piece"
onready var base = get_node("base_piece")
####################################################

func calc_cell(piece):
	base.parent_cell = base.board.world_to_map(base.parent.get_pos())
	#Checks if is selected and calc the movement according
	#to the type of cell being selected
	var calc = 1
	if self.is_in_group("black"):
		calc = -1
	if base.is_selected:
		#Calculation for the pawn piece
		if piece == "pawn":
			print("calculating pawn")
			if base.already_moved:
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -1 * calc))
			else:
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -1 * calc))
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -2 * calc))
				base.already_moved = true
####################################################
func _on_pawn_exit_tree():
	print("I WAS CAPTURED")
