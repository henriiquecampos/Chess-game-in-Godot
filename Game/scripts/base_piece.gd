
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
#onready var board = get_node("/root/main_scene/board")
#onready var controller = get_node("/root/main_scene")

func _ready():
	set_process(true)
	
func _process(delta):
	mouse_click = Input.is_action_pressed("mouse")
	if mouse_click and not mouse_clicked:
		print("Clicked!")
		
	mouse_clicked = mouse_click


