extends Sprite

#Base piece acess variables
export var which_piece = "Piece"
onready var base = get_node("base_piece")

#Rook only variables
var can_cast = true
####################################################

func calc_cell(piece):
	base.parent_cell = base.board.world_to_map(base.parent.get_pos())
	#Checks if is selected and calc the movement according
	#to the type of cell being selected
	if base.is_selected:
		#Calculation for the rook piece
		if piece == "rook":
			print("calculating rook")
			if base.already_moved:
				can_cast = false
			for i in range(0,8):
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -i))
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y +i))
				base.movable_cells.append(Vector2(base.parent_cell.x -i, base.parent_cell.y))
				base.movable_cells.append(Vector2(base.parent_cell.x +i, base.parent_cell.y))
			base.already_moved = true
####################################################