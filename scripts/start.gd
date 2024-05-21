extends Control

@onready var game_logo_start = $GameLogoStart
@onready var start_game = $StartGame
@onready var tutorial = $Tutorial
@onready var intro_music = $IntroMusic


# Called when the node enters the scene tree for the first time.
func _ready():
	var start_screen = true
	GameManager.menu_btns_pos(game_logo_start, start_game, tutorial, start_screen)
	


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
