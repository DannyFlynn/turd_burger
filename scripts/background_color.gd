extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = GameManager.get_screen_size()
	var background_dimensions_x =  viewport_size.x / size.x
	var background_dimensions_y =  viewport_size.y / size.y
	self.scale = Vector2(background_dimensions_x, background_dimensions_y)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
