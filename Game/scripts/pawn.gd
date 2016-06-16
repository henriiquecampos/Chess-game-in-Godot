
extends Sprite

#Base piece acess variables
export var which_piece = "Piece"
onready var base = get_node("base_piece")

var turn = 1

####################################################

func calc_cell(piece):
	base.parent_cell = base.board.world_to_map(base.parent.get_pos())
	#Checks if is selected and turn the movement according
	#to the type of cell being selected

	if self.is_in_group("black"):
		turn = -1
	if base.is_selected:
		#Calculation for the pawn piece
		if piece == "pawn":
			print("Calculating pawn")
			if base.already_moved:
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -1 * turn))
				for cell in base.controller.pieces_cells:
					if cell == Vector2(base.parent_cell.x + (1 * -turn), base.parent_cell.y + (1 * -turn)):
						base.movable_cells.append(cell)
					if cell == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y + (1 * -turn)):
						base.movable_cells.append(cell)

					if cell == Vector2(base.parent_cell.x, base.parent_cell.y -1 * turn):
						base.movable_cells.erase(cell)
						
				#En Passant
				if base.controller.pawn_pos == Vector2(base.parent_cell.x + (1 * -turn), base.parent_cell.y + (1 * -turn)) and base.controller.en_passant:
					base.movable_cells.append(base.controller.pawn_pos)
				elif base.controller.pawn_pos == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y + (1 * -turn)) and base.controller.en_passant:
					base.movable_cells.append(base.controller.pawn_pos)
				base.already_moved = true
			else:
				#En Passant variables
				print(base.controller.pawn_pos)
				base.controller.pawn_pos = base.board.world_to_map(self.get_pos())
				base.controller.pawn_pos = Vector2(base.controller.pawn_pos.x, base.controller.pawn_pos.y + (1 * -turn))
				base.controller.pawn = self
				
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -1 * turn))
				base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -2 * turn))
				
				for cell in base.controller.pieces_cells:
					if cell == Vector2(base.parent_cell.x + (1 * -turn), base.parent_cell.y + (1 * -turn)):
						base.movable_cells.append(cell)
					if cell == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y + (1 * -turn)):
						base.movable_cells.append(cell)

					if cell == Vector2(base.parent_cell.x, base.parent_cell.y -2 * turn):
						base.movable_cells.erase(cell)
				
				#En Passant
				if base.controller.pawn_pos == Vector2(base.parent_cell.x + (1 * -turn), base.parent_cell.y + (1 * -turn)) and base.controller.en_passant:
					base.movable_cells.append(base.controller.pawn_pos)
				elif base.controller.pawn_pos == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y + (1 * -turn)) and base.controller.en_passant:
					base.movable_cells.append(base.controller.pawn_pos)
				base.already_moved = true
####################################################
