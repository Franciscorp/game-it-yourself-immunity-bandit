extends Node

# GAME VARIABLES
var winning_score : int = 250
var score_to_show_game_message_1 : int = 80
var score_to_show_game_message_2 : int = 160

# GAME VARIABLES POSITIONS
var despawn_position_x : int = -15
var game_field_quantity : int = 30

# Distance between spawn of objects in the world
var distance_between_objects : int = 6

# Where in the game field game objects start spawning
var game_objects_spawn_position = 2	
	
# GAME SPEED VARIABLES 
#var game_movement_speed : float = 6
#var game_movement_speed : float = 12
var game_movement_speed : float = 14
#var game_movement_speed : float = 30
var generic_speed_variant : float = 0.5

var blood_animation_delay_time : float = 0.3
var blood_animation_speed_modifier : float = 0.4
var blood_speed_variant : float = 0.1

var pill_animation_delay_time : float = 0.5
var pill_animation_speed_modifier : float = 0.5
