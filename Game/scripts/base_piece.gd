
extends Area2D

export var which_piece = "Piece"

#Base logic booleans
var is_selected = false
var is_on_top = false
var mouse_click = false
var mouse_clicked = false
var already_moved = false
#Cell movement logic
var movable_cells = []
var self_cell = null
var selected_cell = null

#Capture required variables
var opponent_pieces

#Nodes needed
onready var board = get_node("/root/main_scene/board")
onready var controller = get_node("/root/main_scene")

func _ready():
	set_process(true)
####################################################

func _process(delta):
	mouse_click = Input.is_action_pressed("mouse")
	if mouse_click and not mouse_clicked:
		if is_on_top:
			select_piece()
		else:
			move_to()
	mouse_clicked = mouse_click
####################################################

#Verifies which piece is being clicked
func _on_base_piece_mouse_enter():
	is_on_top = true

func _on_base_piece_mouse_exit():
	is_on_top = false
###################################################

func select_piece():
	#Toggle between selected and unselected
	if is_selected == false and self.is_in_group(str(controller.turn)):
		is_selected = true
		if controller.turn == "white":
			calc_cell_white(which_piece)
		elif controller.turn == "black":
			calc_cell_black(which_piece)
	else:
		is_selected = false
####################################################

func calc_cell_white(piece):
	self_cell = board.world_to_map(self.get_pos())
	#Checks if is selected and calc the movement according
	#to the type of cell being selected
	if is_selected:
		#Calculation for the pawn piece
		if piece == "pawn":
			if already_moved:
				movable_cells.append(Vector2(self_cell.x, self_cell.y -1))
			else:
				movable_cells.append(Vector2(self_cell.x, self_cell.y -1))
				movable_cells.append(Vector2(self_cell.x, self_cell.y -2))
				already_moved = true

func calc_cell_black(piece):
	self_cell = board.world_to_map(self.get_pos())
	#Checks if is selected and calc the movement according
	#to the type of cell being selected
	if is_selected:
		#Calculation for the pawn piece
		if piece == "pawn":
			if already_moved:
				movable_cells.append(Vector2(self_cell.x, self_cell.y +1))
			else:
				movable_cells.append(Vector2(self_cell.x, self_cell.y +1))
				movable_cells.append(Vector2(self_cell.x, self_cell.y +2))
				already_moved = true
####################################################

func move_to():
	selected_cell = board.world_to_map(get_viewport().get_mouse_pos())
	if not selected_cell == self_cell:
		if selected_cell in movable_cells:
			var where_cap = capture()
			if selected_cell in where_cap:
				opponent_pieces[where_cap.find(selected_cell)].queue_free()
			set_global_pos(board.map_to_world(selected_cell))
			movable_cells.clear()
			opponent_pieces.clear()
			is_selected = false
			controller.toggle_turn()
####################################################

func capture():
	opponent_pieces = get_node("/root/main_scene/player_black").get_children()
	var capturable = []
	for i in range(0, opponent_pieces.size()):
		capturable.append(board.world_to_map(opponent_pieces[i].get_pos()))
		i += 1
	return capturable