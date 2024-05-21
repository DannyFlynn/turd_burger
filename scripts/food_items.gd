extends Sprite2D

@onready var score_label = $"../ScoreLabel"

@onready var player_sprite = $"../Player/Sprite2D"

@onready var collision_player_shape = $"../Player/CollisionShape2D"

@onready var food_collision = $HitPlate/CollisionShape2D


#Audio sounds
@onready var item_collect_sound = $"../ItemCollect"
@onready var brown_poo_sound = $"../BrownPoo"


@onready var timer = $"../Timer"




const SPRITE_WIDTH = 100
#offset
var offcenter = SPRITE_WIDTH / 2



var start_spawn = 0
var end_spawn
var speed = 200
var random_location = []
var destroy_item_below




var sprites = [preload("res://assets/patty_drop.png"), preload("res://assets/tomato_drop.png"), preload("res://assets/cheese_drop.png"), preload("res://assets/lettuce_drop.png"), preload("res://assets/onion_drop.png"), preload("res://assets/poop.png"), preload("res://assets/green_poop.png"), preload("res://assets/burger_top.png")]

var middle_texture = preload("res://assets/middle_burger.png")


var patty = sprites[0]
var tomato = sprites[1]
var cheese = sprites[2]
var lettuce = sprites[3]
var onion = sprites[4]
var poo = sprites[5]
var green_poo = sprites[6]
var burger_top = sprites[7]
var food_sprites = [patty, tomato, cheese, lettuce, onion, poo, green_poo, burger_top]


var food_texture




var player_pos_y
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	player_pos_y = player_sprite.global_position.y
	var viewport_size = GameManager.get_screen_size()
	destroy_item_below = viewport_size.y
	

	var random_sprite = randi_range(0, len(food_sprites) - 1)
	food_texture = food_sprites[random_sprite]
	texture = food_texture
	
	
	
	var columns = viewport_size.x / 5
	var sprite_dimensions = columns / SPRITE_WIDTH
	self.scale = Vector2(sprite_dimensions / 2, sprite_dimensions / 2)
	
	random_location = [columns - columns, columns*1, columns*2, columns*3, columns*4]
	var spawn = randi_range(0, len(random_location) - 1)
	position.x = random_location[spawn] + offcenter
	position.y = -300
	food_collision.position.x = 0
	food_collision.position.y = 0
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta
	destroy_food_below()




func _on_hit_plate_body_entered(body):
	#print(player_sprite.get_rect())
	
	if global_position.y < player_sprite.global_position.y:
		if food_texture == green_poo:
			score_label.text = GameManager.get_score()
			queue_free()
			GameManager.reset_score()
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		elif food_texture == poo:
			item_brown_poop()
			GameManager.decrement_score(10)
			score_label.text = GameManager.get_score()
			queue_free()
		elif food_texture == patty:
			food_spawn_speed()
			item_collected()
			tower_burger()
			GameManager.increment_score(1)
			score_label.text = GameManager.get_score()
			queue_free()
		elif food_texture == tomato:
			food_spawn_speed()
			item_collected()
			tower_burger()
			GameManager.increment_score(2)
			score_label.text = GameManager.get_score()
			queue_free()
		elif food_texture == lettuce:
			food_spawn_speed()
			item_collected()
			tower_burger()
			GameManager.increment_score(3)
			score_label.text = GameManager.get_score()
			queue_free()
		elif food_texture == cheese:
			food_spawn_speed()
			item_collected()
			tower_burger()
			GameManager.increment_score(4)
			score_label.text = GameManager.get_score()
			queue_free()
		elif food_texture == onion:
			food_spawn_speed()
			item_collected()
			tower_burger()
			GameManager.increment_score(5)
			score_label.text = GameManager.get_score()
			queue_free()
		elif food_texture == burger_top:
			food_spawn_speed()
			item_collected()
			burger_complete()
			queue_free()
		
			

func food_spawn_speed():
	if GameManager.speed_timer == true and timer.wait_time > 0.4:
		#print(timer.wait_time, "timer")
		timer.wait_time = timer.wait_time - 0.10
		speed += 20
		GameManager.speed_timer = false


#audio
func item_collected():
	item_collect_sound.play()

func item_brown_poop():
	brown_poo_sound.play()
		

	
func destroy_food_below():
	if position.y > destroy_item_below:
		queue_free()
		
		


var child_found = false
func tower_burger():
	
	print(GameManager.burger_stack_tracker())
	GameManager.add_to_burger_stack()
	if GameManager.burger_stack_tracker() < 18:
		var burger_middle = player_sprite
		var burger_middle_height = burger_middle.get_rect().size[1]
		var new_item = Sprite2D.new()
		new_item.texture = middle_texture



		if burger_middle.get_child_count() == 0:
		
	
			new_item.position.y += -burger_middle_height  / 2
	
			var xaxis = collision_player_shape.shape.size[0]
			var yaxis = collision_player_shape.shape.size[1] 
			collision_player_shape.shape.size = Vector2(xaxis, yaxis + burger_middle_height)
	
			burger_middle.add_child(new_item)
		

		else:
			var child_burger = burger_middle.get_children()[0]
			var next_child = burger_middle.get_children()[0]
		
		
		
			if child_burger.get_child_count() == 0:
			
			
				new_item.position.y += -burger_middle_height  / 2
		
			
				var xaxis = collision_player_shape.shape.size[0]
				var yaxis = collision_player_shape.shape.size[1] #+ 20
			
				collision_player_shape.shape.size = Vector2(xaxis, yaxis + burger_middle_height)
			
			
				child_burger.add_child(new_item)
	
			else:
				while child_found == false:
					if next_child.get_child_count() != 0:
					
						next_child = next_child.get_children()[0]
					#child_found = true
					elif next_child.get_child_count() == 0:
					
					
						new_item.position.y += -burger_middle_height  / 2
					
						var xaxis = collision_player_shape.shape.size[0]
						var yaxis = collision_player_shape.shape.size[1] 
						collision_player_shape.shape.size = Vector2(xaxis, yaxis + burger_middle_height)
						next_child.add_child(new_item)
					
						child_found = true
						return


func burger_complete():
	GameManager.reset_burger_stack_tracker()
	var children = player_sprite.get_children()
	print(children)
	var child = player_sprite.get_child(0)
	player_sprite.remove_child(child)
	var xaxis = collision_player_shape.shape.size[0]
	collision_player_shape.shape.size = Vector2(xaxis, 40)
	
	#collision_player_shape.queue_free()

