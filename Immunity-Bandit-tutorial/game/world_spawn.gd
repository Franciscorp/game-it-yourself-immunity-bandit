extends Node3D

# CONSTANTS That represent the object spawning in the field
const INVALID_VALUE = -1
const EMPTY_FIELD = 0
const T_CELL = 1
const BASIC_PILL = 2

# Here we associate a scene to the object to be spawned in the game
@export var basic_wall_scene: PackedScene = null
@export var red_cell_scene: PackedScene = null


# Connects to the  game 
@export var game: Node3D = null
@onready var world_objects = %WorldSpawn

# This random, serves the purpose to help generating a random value
var _random = RandomNumberGenerator.new()
var game_field_positions : Array = []
var lane_positions_z = [-3, 0, 3]
var lane_positions_y = [-0.5, -1, -0.5]
var t_cell_lane_positions_y = [0, -0.5, 0]
var field_id = 0

# EXAMPLE OF 10 FIELD COLUMNS AND 3 ROWS
# -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 
# -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 
# -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 

# percentage of drop
# Define items and their respective percentages
# EMPTY_FIELD = 0
# T_CELL = 1
# BASIC_PILL = 2
var game_objects_percentage = [
	{"object": 0, "percentage": 25},
	{"object": 1, "percentage": 25},
	{"object": 2, "percentage": 50}
]


func game_setup() -> void:	
	# Setup the game fields
	field_id = 0
	# Clears the array to avoid repetead values on death
	game_field_positions.clear()
	# Goes through the first set of game fields (30) 
	# Adds to the array the values from each object on each line
	for i in range(UtilGameSettings.game_field_quantity):
		generate_objects_in_game_field()
	
	# Spawns all walls and red cells in the first set of game fields
	for n in UtilGameSettings.game_field_quantity:
		spawn_wall(n * UtilGameSettings.distance_between_objects)
		spawn_red_cell(n * UtilGameSettings.distance_between_objects)
		
#	print_game_field()

# Spawns the coming game field. this comes in the end of the game field
func spawn_current_game_field() -> void:
	spawn_in_z_lane(game_field_positions[field_id], field_id)

# searchs each z line 0, 1, 2 
# If the lane has an ID from PILL or T Cell spawns the object there
func spawn_in_z_lane(field_position, x_position) -> void:
#	print("[field_position] = ", field_position)
	for lane_position in range(3):
		if field_position[lane_position] == T_CELL:
			spawn_t_cell(x_position * UtilGameSettings.distance_between_objects * 2, lane_position)
		if field_position[lane_position] == BASIC_PILL:
			spawn_pill(x_position * UtilGameSettings.distance_between_objects * 2, lane_position)
	
# Adds ID to the next z lane coming based on the chanced indicated above
func generate_objects_in_game_field():
	# Add an array for each case
	game_field_positions.append([-1, -1, -1])
	
	# Sets the number of empty fields for this column
	var number_of_empty_fields = _random.randi_range(1, 2)
	
	# Following the number of empty fields on this column 
	for empty in number_of_empty_fields:
		var field_position = _random.randi_range(0, 2)
		game_field_positions[field_id][field_position] = 0 
	
	# In the Z lane generates random pill or T cell
	generate_object_in_z_lane()
	# Spawn of the current game field
	if field_id >= UtilGameSettings.game_objects_spawn_position:
		spawn_current_game_field()
#		print("field_id = ", field_id)

	field_id = field_id + 1
	
	
# Chooses random item to spawn on z lane positions with -1	
func generate_object_in_z_lane() -> void:
	var field_position = 0
	
	# Checks what field is not occupied in the collumn
	for field in game_field_positions[field_id]:
		
		# If it has nothing, spawns a random objects
		if field == -1:
			var object_to_spawn = choose_random_object()
			game_field_positions[field_id][field_position] = object_to_spawn
			
		field_position = field_position + 1
	
	
# Function to randomly choose an object based on percentages
func choose_random_object() -> int:
	var total_percentage = 0
	var random_value = randi_range(0, 100)
	
	for object in game_objects_percentage:
		total_percentage += object["percentage"]
		if random_value < total_percentage:
			return object["object"]

	# Default return (shouldn't reach this point)
	return 0
	
		
# Print game field bidemensional array into the console
# Serves as debugging tool to visualize the objects
func print_game_field() -> void:
	var i = 0
	for z_lanes in game_field_positions:
		print(z_lanes, " = ", i)
		i = i + 1
	print("field_id = ", field_id)
	
# Function that spawns walls in the game scene 
# Each spawn wall is suppose to spawn at the end of last position added
func spawn_wall(x_spawn_position):
	var wall = basic_wall_scene.instantiate()
	wall.position.x = x_spawn_position
	world_objects.add_child(wall)
	
	
	#	var t_cell = t_cell_scene.instantiate()
#	t_cell.position.x = x_spawn_position
#	t_cell.position.z = lane_positions_z[z_lane_position]
#	t_cell.position.y = t_cell_lane_positions_y[z_lane_position]
#
#	world_objects.add_child(t_cell)
#
#	if !t_cell.t_cell_captured.is_connected(game.player_scored):
#		t_cell.t_cell_captured.connect(game.player_scored)
	
	#	var pill = basic_pill_scene.instantiate()
#	pill.position.x = x_spawn_position
#	pill.position.z = lane_positions_z[z_lane_position]
#	pill.position.y = lane_positions_y[z_lane_position]
#	world_objects.add_child(pill)
#	if !pill.pill_contact.is_connected(game.life_lost):
#		pill.pill_contact.connect(game.life_lost)
	
	
# Function that spawns a T Cell in the game scene 
# Each spawn T Cell spawns at the end of last position added
# Spawns in the correct X, height and Z
# Connects t cell spawned to the game score signal
func spawn_t_cell(x_spawn_position, z_lane_position):
	pass
		
	
# Function that spawns a Pill in the game scene 
# Each spawn Pill spawns at the end of last position added
# Spawns in the correct X, height and Z
# Connects Pill spawned to the game score signal to lose a life	
func spawn_pill(x_spawn_position, z_lane_position):
	pass
	
# Function that spawns a red_cell in the game scene 
# Each spawn red_cell spawns at the end of last position added
# Spawns in the correct X, height and y are more random because 
# It doesn't interfere with gameplay
func spawn_red_cell(x_spawn_position):
	var red_cell = red_cell_scene.instantiate()
	red_cell.position.x = x_spawn_position
	red_cell.position.z = _random.randi_range(-5, 5)
	red_cell.position.y = _random.randf_range(3, 10)
	world_objects.add_child(red_cell)
