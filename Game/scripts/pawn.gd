
extends Sprite

#Base piece acess variables
export var which_piece = "Piece"
onready var base = get_node("base_piece")
####################################################

func calc_cell(piece):
	base.parent_cell = base.board.world_to_map(base.parent.get_pos())
	#Checks if is selected and turn the movement according
	#to the type of cell being selected
	var turn = 1
	if self.is_in_group("black"):
		turn = -1
	if base.is_selected:
		#turnulation for the pawn piece
		if piece == "pawn":
			print("turnulating pawn")
			if base.already_moved:
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -1 * turn))
				for cell in base.controller.pieces_cells:
					if cell == Vector2(base.parent_cell.x + (1 * -turn), base.parent_cell.y + (1 * -turn)):
						base.movable_cells.append(cell)
						print("Capture")
					if cell == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y - (1 * -turn)):
						base.movable_cells.append(cell)
						print("Capture")
					if cell == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y + (1 * -turn)):
						base.movable_cells.append(cell)
						print("Capture")
					if cell == Vector2(base.parent_cell.x, base.parent_cell.y -1 * turn):
						base.movable_cells.erase(cell)
			else:
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -1 * turn))
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -2 * turn))
				for cell in base.controller.pieces_cells:
					if cell == Vector2(base.parent_cell.x + (1 * -turn), base.parent_cell.y + (1 * -turn)):
						base.movable_cells.append(cell)
						print("Capture")
					if cell == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y - (1 * -turn)):
						base.movable_cells.append(cell)
						print("Capture")
					if cell == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y + (1 * -turn)):
						base.movable_cells.append(cell)
						print("Capture")
					if cell == Vector2(base.parent_cell.x, base.parent_cell.y -1 * turn):
						base.movable_cells.erase(cell)
				base.already_moved = true
####################################################
