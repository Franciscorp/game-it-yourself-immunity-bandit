extends Node3D

# Makes it so that you can change the speed of the game in the inspector 
@export_range(0.5, 3) var speed_variant : float = UtilGameSettings.generic_speed_variant

# Reference to its own parent
@onready var game = $"../../WorldSpawn"


func _process(delta):
	# Creates the movement towards the virus over time
	position.x -= UtilGameSettings.game_movement_speed * speed_variant * delta
	# If the game reachs the declared despawn position, creates another wall at the end of the field
	# generates a z line with some random objects
	# Clears this wall from the game so it doesn't occupy memory
	if position.x < UtilGameSettings.despawn_position_x:
		game.spawn_wall(position.x + (UtilGameSettings.game_field_quantity * UtilGameSettings.distance_between_objects))
		game.generate_objects_in_game_field()
		queue_free()
