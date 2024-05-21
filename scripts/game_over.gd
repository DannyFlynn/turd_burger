extends Control

@onready var game_over_logo = $GameOverLogo
@onready var menu = $Menu
@onready var reset = $Reset

# Called when the node enters the scene tree for the first time.
func _ready():
	var start_screen = false
	GameManager.menu_btns_pos(game_over_logo, menu, reset, start_screen)



func _on_reset_button_down():
	GameManager.reset_score()
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_menu_button_down():
	GameManager.reset_score()
	get_tree().change_scene_to_file("res://scenes/start.tscn")
