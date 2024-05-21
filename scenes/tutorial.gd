extends Node2D


@onready var turdburger_tutorial = $TurdburgerTutorial
@onready var close = $Button

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport = GameManager.get_screen_size()
	var bg_width = viewport[0] / 1590
	var bg_height = viewport[1] / 2000
	turdburger_tutorial.position = Vector2(0, 0)
	turdburger_tutorial.scale = Vector2(bg_width, bg_height)
	close.position.x = viewport[0] - 40
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
