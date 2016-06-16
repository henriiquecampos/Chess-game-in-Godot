
extends Sprite

#Base piece acess variables
export var which_piece = "Piece"
onready var base = get_node("base_piece")

#King only variables
var can_cast = true
var dead = false
####################################################

func calc_cell(piece):
	base.parent_cell = base.board.world_to_map(base.parent.get_pos())
	#Checks if is selected and calc the movement according
	#to the type of cell being selected
	if base.is_selected:
		#Calculation for the king piece
		if piece == "king":
			print("calculating king")
			if base.already_moved:
				can_cast = false
			#Diagonal
			base.movable_cells.append(Vector2(base.parent_cell.x -1, base.parent_cell.y -1))
			base.movable_cells.append(Vector2(base.parent_cell.x +1, base.parent_cell.y +1))
			base.movable_cells.append(Vector2(base.parent_cell.x -1, base.parent_cell.y +1))
			base.movable_cells.append(Vector2(base.parent_cell.x +1, base.parent_cell.y -1))
			#Vertical and horizontal
			base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y -1))
			base.movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y +1))
			base.movable_cells.append(Vector2(base.parent_cell.x -1, base.parent_cell.y))
			base.movable_cells.append(Vector2(base.parent_cell.x +1, base.parent_cell.y))
####################################################


func _on_king_exit_tree():
	get_tree().quit()
