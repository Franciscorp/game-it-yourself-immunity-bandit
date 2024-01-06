extends Node3D

@onready var game = $"../../WorldSpawn"
@onready var _animation_player : AnimationPlayer = $AnimationPlayer

# 0.1 is the default
@onready var speed_variant : float = UtilGameSettings.blood_speed_variant
@onready var animation_speed_variant : float = UtilGameSettings.blood_animation_speed_modifier
@onready var animation_delay_time : float = UtilGameSettings.blood_animation_delay_time

var _random = RandomNumberGenerator.new()
var _random_speed : float
var _blood_animation : String
var default_map_end_position_x


func _ready():
	default_map_end_position_x = UtilGameSettings.game_field_quantity * UtilGameSettings.distance_between_objects
	_random_speed = _random.randf_range(1.0 - speed_variant, 1.0 + speed_variant)
	
	# Choose a random animation from the 3 animations that exist
	# Sets it ready to play next
	var _blood_animations_names = _animation_player.get_animation_list()
	var _blood_animation_number = _random.randi_range(0, _blood_animations_names.size() - 1)
	_blood_animation = _blood_animations_names[_blood_animation_number]
	
	# To create some differences in animation, all of start at different time
	# this function takes a random time between 0 and the define delay time and then starts
	await get_tree().create_timer(_random.randf_range(0, animation_delay_time)).timeout
	_animation_player.play(_blood_animation)
	# TO further this variation, a slight change to the speed of the animation is also applied
	_animation_player.speed_scale = _random.randf_range(1 - animation_speed_variant, 1 + animation_speed_variant)
	

func _process(delta):
	# give a small random speed at each cell, so it appears more natural
	position.x -= UtilGameSettings.game_movement_speed * delta * _random_speed
	# When gets to the end position, spawns a new red cell at the end of the game field
	if position.x < UtilGameSettings.despawn_position_x:
		game.spawn_red_cell(position.x + default_map_end_position_x)
		queue_free()
