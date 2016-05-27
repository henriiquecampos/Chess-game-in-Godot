
extends Area2D

export var piece_group = "insert piece group"

#Conditional variables
var is_selected = false
var is_on_top = false
var mouse_click = false
var prev_clicked = false
var already_moved = false

#Movement cells
var movable_cells = []
var self_cell = Vector2 (0,0)
var clicked_cell = Vector2(0,0)

onready var board = get_node("/root/main_scene/board")
onready var controller = get_node("/root/main_scene")

func _ready():
	set_process(true)

func _process(delta):
	mouse_click = Input.is_action_pressed("mouse")

	#Verifies if the piece is selected
	if(mouse_click and not prev_clicked):
		select_unity()
		if is_selected:
			print(clicked_cell)
		if (clicked_cell in movable_cells):
			print("can move")
			if clicked_cell != self_cell:
				move_to(clicked_cell)
		else:
			print("cant move")
	prev_clicked = mouse_click

func select_unity():
	#Verifies if the mouse is on top of the piece, because if not it can't be selected
	if is_on_top:
		#Toggle between selected and deselected states
		if (is_selected == false) and (self.is_in_group(controller.turn)):
			is_selected = true
			#Calc the avaible cells the unity can move to
			calc_cell(piece_group)
			print("selected")
		else:
			is_selected = false
			print("deselected")
			
func move_to(cell):
	set_global_pos(board.map_to_world(cell))
	is_selected = false
	movable_cells.clear()
	if controller.turn == "white":
		controller.turn = "black"
		print(controller.turn)
	elif controller.turn == "black":
		controller.turn = "white"
		print(controller.turn)

func calc_cell(piece):
	self_cell = board.world_to_map(self.get_global_pos())
	clicked_cell = board.world_to_map(get_viewport().get_mouse_pos())
	#Verifies which piece is moving
	if piece == "pawn":
		if already_moved:
			if controller.turn == "white":
				movable_cells.append(Vector2(self_cell.x, self_cell.y -1))
			elif controller.turn == "black":
				movable_cells.append(Vector2(self_cell.x, self_cell.y +1))
		else:
			if controller.turn == "white":
				movable_cells.append(Vector2(self_cell.x, self_cell.y -1))
				movable_cells.append(Vector2(self_cell.x, self_cell.y -2))
			elif controller.turn == "black":
				movable_cells.append(Vector2(self_cell.x, self_cell.y +1))
				movable_cells.append(Vector2(self_cell.x, self_cell.y +2))
	print(movable_cells)

func _on_pawn_mouse_enter():
	is_on_top = true

func _on_pawn_mouse_exit():
	is_on_top = false