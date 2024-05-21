extends Label

# Called when the node enters the scene tree for the first time.

var label_text
var label_text_length = len(GameManager.get_score())

func _ready():
	label_text = GameManager.set_score()
	print(len(label_text))
	var viewport_size = GameManager.get_screen_size()
	var score_position = viewport_size.x - size.x - 20
	position.x = score_position
	text = label_text
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	adjust_label_on_score()
	
func adjust_label_on_score():
	var adjust_label = len(GameManager.get_score())
	if adjust_label > label_text_length:
		position.x = position.x - 50
		label_text = GameManager.get_score()
		label_text_length = adjust_label
		print("it works")
		print(adjust_label)
