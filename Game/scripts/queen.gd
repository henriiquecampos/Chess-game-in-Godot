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
			#Diagonal movement
			for i in range(1,8):
				var cell = Vector2(base.parent_cell.x -i, base.parent_cell.y -i)
				if cell in base.controller.pieces_cells:
					base.movable_cells.append(cell)
					break
				else:
					base.movable_cells.append(cell)
			for i in range(1,8):
				var cell = Vector2(base.parent_cell.x +i, base.parent_cell.y +i)
				if cell in base.controller.pieces_cells:
					base.movable_cells.append(cell)
					break
				else:
					base.movable_cells.append(cell)
			for i in range(1,8):
				var cell = Vector2(base.parent_cell.x -i, base.parent_cell.y +i)
				if cell in base.controller.pieces_cells:
					base.movable_cells.append(cell)
					break
				else:
					base.movable_cells.append(cell)
			for i in range(1,8):
				var cell = Vector2(base.parent_cell.x + i, base.parent_cell.y -i)
				if cell in base.controller.pieces_cells:
					base.movable_cells.append(cell)
					break
				else:
					base.movable_cells.append(cell)
			#Perpendicular movement
			for i in range(1,8):
				var cell = Vector2(base.parent_cell.x, base.parent_cell.y -i)
				if cell in base.controller.pieces_cells:
					base.movable_cells.append(cell)
					break
				else:
					base.movable_cells.append(cell)
			for i in range(1,8):
				var cell = Vector2(base.parent_cell.x, base.parent_cell.y +i)
				if cell in base.controller.pieces_cells:
					base.movable_cells.append(cell)
					break
				else:
					base.movable_cells.append(cell)
			for i in range(1,8):
				var cell = Vector2(base.parent_cell.x -i, base.parent_cell.y)
				if cell in base.controller.pieces_cells:
					base.movable_cells.append(cell)
					break
				else:
					base.movable_cells.append(cell)
			for i in range(1,8):
				var cell = Vector2(base.parent_cell.x + i, base.parent_cell.y)
				if cell in base.controller.pieces_cells:
					base.movable_cells.append(cell)
					break
				else:
					base.movable_cells.append(cell)