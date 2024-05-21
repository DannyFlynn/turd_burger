extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = GameManager.get_screen_size()
	
	position.x = 0
	position.y = 0

	scale = Vector2(viewport_size.x / 2048, viewport_size.y / 2048)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
