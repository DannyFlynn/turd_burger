extends Node2D


const COLUMNS: float = 5
const BUTTON_MARGIN: int = 50

@onready var right_btn = $Right
@onready var left_btn = $Left
@onready var player = $Player
@onready var timer = $Timer

var food = preload("res://scenes/food_items.tscn")
#var test_food = preload("res://scenes/food_items.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = GameManager.get_screen_size()
	
	
	timer.start()
	


func _on_timer_timeout():
	var spawn_food = food.instantiate()
	add_child(spawn_food)
	
	

	
