extends Node

##screen size
func get_screen_size():
	var viewport = get_viewport()
	
	# Get the size of the viewport
	var screen_size = viewport.get_visible_rect().size
	
	# Return the screen width and height
	return screen_size

##score
var score = 0
var marker = 20
var speed_timer = false
var burger_stack = 0

#on first load
func set_score():
	
	return get_score()

#after score is incremented
func get_score():
	
	return "Score: " + str(score)
	
func increment_score(amount):
	score += amount
	if score >= marker:
		speed_timer = true
		marker += 30


func decrement_score(amount):
	if score >= 10:
		score -= amount
	else:
		score = 0

	
func reset_score():
	score = 0

func burger_stack_tracker():
	return burger_stack

func add_to_burger_stack():
	burger_stack += 1


func reset_burger_stack_tracker():
	burger_stack = 0
	

##menu buttons and logos (start, retry, tutorial, menu) position
func menu_btns_pos(logo, btn_one, btn_two, start_screen):
	var screen_height = get_screen_size()[1]
	screen_height = screen_height - screen_height + 100
	logo.position.y = logo.position.y - 106
	if start_screen:
		btn_one.position.y = logo.position.y + 250
	else:
		btn_one.position.y = logo.position.y + 150
	btn_two.position.y = btn_one.position.y + 100
	

