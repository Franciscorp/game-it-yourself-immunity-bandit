extends Node3D

signal t_cell_captured

@export_range(0.5, 3) var speed_variant : float = UtilGameSettings.generic_speed_variant


func _process(delta):
	# Creates the movement towards the virus over time
	position.x -= UtilGameSettings.game_movement_speed * speed_variant * delta
	# If the game reachs the declared despawn position, creates another wall at the end of the field
	if position.x < UtilGameSettings.despawn_position_x:
		queue_free()

# This function serves to detect if the player touchs the area of the pill
# On collision with player, a signal is emit and in the game class
# The game detects as a life lost to the player
func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		t_cell_captured.emit()
#		print("Player collided")
		queue_free()
