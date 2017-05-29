tool

extends "res://globals/item.gd"

var clicked = false

func is_clicked():
	return clicked

func input(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON || event.is_action("ui_accept"):
		if event.is_pressed():
			clicked = true
			get_tree().call_group(0, "game", "clicked", self, get_pos())
			_check_focus(true, true)
		else:
			clicked = false
			_check_focus(true, false)
func _ready():
	add_to_group("items_bg")

