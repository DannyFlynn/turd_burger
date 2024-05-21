extends Panel


@onready var left_btn = $"../Left"
@onready var right_btn = $"../Right"

const COLUMNS: float = 5
const BUTTON_MARGIN: int = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	#game container buttons  
	var viewport_size = GameManager.get_screen_size()
	size.x = viewport_size.x
	position.y = viewport_size.y - 200
	size.y = 200
	
	var vertical_position = viewport_size.y - left_btn.size.y - BUTTON_MARGIN
	var left_position_x = 0  + BUTTON_MARGIN
	left_btn.position = Vector2(left_position_x, vertical_position) 
 
	var right_position_x = viewport_size.x - right_btn.size.x - BUTTON_MARGIN
	right_btn.position = Vector2(right_position_x, vertical_position)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
