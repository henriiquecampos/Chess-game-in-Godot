
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
		#Calculation for the knight piece
		if piece == "knight":
			print("calculating knight")
			base.movable_cells.append(Vector2(base.parent_cell.x +2, base.parent_cell.y +1))
			base.movable_cells.append(Vector2(base.parent_cell.x +1, base.parent_cell.y +2))
			base.movable_cells.append(Vector2(base.parent_cell.x +2, base.parent_cell.y -1))
			base.movable_cells.append(Vector2(base.parent_cell.x +1, base.parent_cell.y -2))
			
			base.movable_cells.append(Vector2(base.parent_cell.x -2, base.parent_cell.y +1))
			base.movable_cells.append(Vector2(base.parent_cell.x -1, base.parent_cell.y +2))
			base.movable_cells.append(Vector2(base.parent_cell.x -2, base.parent_cell.y -1))
			base.movable_cells.append(Vector2(base.parent_cell.x -1, base.parent_cell.y -2))

####################################################