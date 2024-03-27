extends Button

var dragging = false
var startY = 0
var padding = 0
func _ready():
	padding = rect_size.y / 2
	connect("button_down", self, "start_drag")
	connect("button_up", self, "stop_drag")

func start_drag():
	startY = get_viewport().get_mouse_position().y
	dragging = true

func stop_drag():
	dragging = false
	startY = 0

func _process(_delta):
	if dragging:
		print(padding)
		print(startY)
		var offset = startY - get_viewport().get_mouse_position().y
		if offset > padding and self.get_position_in_parent() != 0:
			get_parent().move_child(self, self.get_position_in_parent() - 1)
			startY -= padding * 2
			
			
		elif offset < -padding and self.get_position_in_parent() < get_parent().get_child_count():
			get_parent().move_child(self, self.get_position_in_parent() + 1)
			startY += padding * 2
