extends CharacterBody2D

@onready var player_size = $Sprite2D
@onready var player_collider = $CollisionShape2D


@onready var food_items = $"../FoodItems"


var speed = 150

var move_column
var out_of_bounds_left
var out_of_bounds_right

const SPRITE_WIDTH = 150
var offset = SPRITE_WIDTH / 2

var stack_checker = GameManager.score
# Called when the node enters the scene tree for the first time.

var middle_texture = preload("res://assets/middle_burger.png")



func _ready():

	var viewport_size = GameManager.get_screen_size()
	var width = viewport_size.x
	move_column = viewport_size.x / 5
	out_of_bounds_left = move_column - 10
	out_of_bounds_right = move_column * 4
	
		#shape the player for different screen sizes column width / by sprite width
	
	var player_dimensions = move_column / SPRITE_WIDTH
	player_size.scale = Vector2(player_dimensions,player_dimensions)
	
	var offset = player_size.scale.x * SPRITE_WIDTH / 2
	#print(offset)
	
	player_collider.scale = Vector2(player_size.scale.x,player_size.scale.y)
	
	
	#player position
	var player_y_pos = viewport_size.y - 250
	var player_x_pos = move_column * 2
	position = Vector2(player_x_pos + offset, player_y_pos)
	

func _process(delta):
	#burger_stacker()
	move_and_slide()
	

func _on_right_pressed():
	if position.x < out_of_bounds_right:
		position.x += move_column
		


func _on_left_pressed():
	if position.x > out_of_bounds_left:
		position.x -= move_column
		

