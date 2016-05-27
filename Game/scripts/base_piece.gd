
extends Area2D

#Base logic booleans
var is_selected = false
var is_on_top = false
var mouse_click = false
var mouse_clicked = false

#Cell movement logic
var movable_cells = []
var self_cell = null
var selected_cell = null

#Nodes needed
onready var board = get_node("/root/main_scene/board")
#onready var controller = get_node("/root/main_scene")

func _ready():
	set_process(true)
####################################################

func _process(delta):
	mouse_click = Input.is_action_pressed("mouse")
	if mouse_click and not mouse_clicked:
		calc_cell("pawn")
		if is_on_top:
			select_piece()
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
	if is_selected == false:
		is_selected = true
		print(is_selected)
	else:
		is_selected = false
		print(is_selected)
####################################################

func calc_cell(piece):
	self_cell = board.world_to_map(self.get_pos())
	selected_cell = board.world_to_map(get_viewport().get_mouse_pos())
	if is_selected:
		print(self_cell)
		print(selected_cell)
	