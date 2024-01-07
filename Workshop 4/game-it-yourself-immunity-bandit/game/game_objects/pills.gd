extends Node3D

signal pill_contact

# Makes it so that you can change the speed of the game in the inspector 
@export_range(0.5, 3) var speed_variant : float = UtilGameSettings.generic_speed_variant

@onready var _animation_player = $AnimationPlayer
@onready var animation_delay_time : float = UtilGameSettings.pill_animation_delay_time
@onready var animation_speed_variant : float = UtilGameSettings.pill_animation_speed_modifier


func _ready():
	# To create some differences in animation, all of start at different time
	# this function takes a random time between 0 and the define delay time and then starts
	await get_tree().create_timer(randf_range(0, animation_delay_time)).timeout
	_animation_player.play("tumbling")
	# TO further this variation, a slight change to the speed of the animation is also applied
	_animation_player.speed_scale = randf_range(1 - animation_speed_variant, 1 + animation_speed_variant)


func _process(delta):
	# Creates the movement towards the virus over time
	position.x -= UtilGameSettings.game_movement_speed * speed_variant * delta
	# If the game reachs the declared despawn position, creates another wall at the end of the field
	if position.x < UtilGameSettings.despawn_position_x:
		queue_free()

# This function serves to detect if the player touchs the area of the pill
# On collision with player, a signal is emit and in the game class
# The game detects as a scored added to the player
func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		pill_contact.emit()
#		print("Player collided with pill")
		queue_free()
