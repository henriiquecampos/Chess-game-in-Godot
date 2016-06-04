extends Sprite

#Base piece acess variables
export var which_piece = "Piece"
onready var base = get_node("base_piece")
####################################################

func calc_cell(piece):
	base.parent_cell = base.board.world_to_map(base.parent.get_pos())
	#Checks if is selected and calc the movement according
	#to the type of cell being selected
	if base.is_selected:
		#Calculation for the queen piece
		if piece == "queen":
			print("calculating queen")
			for i in range(0,8):
				#Diagonal
				base.movable_cells.append(Vector2(base.parent_cell.x -i, base.parent_cell.y -i))
				base.movable_cells.append(Vector2(base.parent_cell.x +i, base.parent_cell.y +i))
				base.movable_cells.append(Vector2(base.parent_cell.x -i, base.parent_cell.y +i))
				base.movable_cells.append(Vector2(base.parent_cell.x +i, base.parent_cell.y -i))
				#Vertical and horizontal
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -i))
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y +i))
				base.movable_cells.append(Vector2(base.parent_cell.x -i, base.parent_cell.y))
				base.movable_cells.append(Vector2(base.parent_cell.x +i, base.parent_cell.y))
####################################################