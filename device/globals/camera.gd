extends Camera2D

func clamp_camera():
	var scene = $"/root/scene"
	var area = Rect2()
	for child in scene.get_children():
		if child is preload("res://globals/background.gd"):
			area.position = child.get_global_position()
			area.size = child.get_size()
		if child is preload("res://globals/background_area.gd"):
			area.position = child.get_global_position()
			area.size = child.get_texture().get_size()

	if area:
		limit_left = area.position.x
		limit_top = area.position.y
		limit_right = area.position.x + area.size.x
		limit_bottom = area.position.y + area.size.y

func _ready():
	add_to_group("camera")

	vm.set_camera(self)

	clamp_camera()
