extends Node3D

# Connects to world spawn, where the t cells and pills are spawn
signal lives_changed(current_lives)
signal score_changed(current_score)

@export var t_cell_point_value : int = 10
@export var player: Player
@export var hud: HUD

@onready var world_spawn = %WorldSpawn
@onready var dead_screen = $DeadScreen
@onready var game = $"."

# Game Data
@onready var lifes = 3
@onready var score = 0

var _starting_position : Vector3 = Vector3(0, 1.5, 0)
var _is_message_1_showed : bool = false
var _is_message_2_showed : bool = false
var _is_message_final_showed : bool = false


func _ready():
	# On start prepares the first 30 game fields with objects 
	world_spawn.game_setup()

# when a pill collides with a player the signal gets here
# a life is lost and updates the HUD with that information
func life_lost() -> void:
	lifes = lifes - 1
	lives_changed.emit(lifes)
	reset_game()


# Function called to start game dialogues and pause the game
func show_dialog(dialogue_path : String, dialogue_choice : String) -> void:
	DialogueManager.show_example_dialogue_balloon(load(dialogue_path), dialogue_choice)
	get_tree().paused = true


# Function called in game dialogues to restart the game and unpause
func finish_dialog() -> void:
	get_tree().paused = false

# Function called in game dialogues to restart the game and unpause
func finish_winning_dialog() -> void:
	update_endgame_score()
	get_tree().paused = false
	get_tree().change_scene_to_file(Util.END_SCENE)

# when a t_cel collides with a player the signal gets here
# the score is added and updates the HUD with that information
func player_scored() -> void:
	score = score + t_cell_point_value
	score_changed.emit(score)
	if score > UtilGameSettings.score_to_show_game_message_1 and !_is_message_1_showed:
		show_dialog(Util.MESSAGE_1_DIALOGUE_PATH, Util.GAME_1_DIALOGUE)
		_is_message_1_showed = true
	if score > UtilGameSettings.score_to_show_game_message_2 and !_is_message_2_showed:
		show_dialog(Util.MESSAGE_2_DIALOGUE_PATH, Util.GAME_2_DIALOGUE)
		_is_message_2_showed = true
	if score > UtilGameSettings.winning_score and !_is_message_final_showed:
		show_dialog(Util.FINAL_MESSAGE_DIALOGUE_PATH, Util.GAME_FINAL_DIALOGUE)
		_is_message_final_showed = true
	
# Resets game field
# Cleans up all the precious game elements
# if no more lifes goes to end screen
# else waits for the end of death screen and resets the game field and player
func reset_game() -> void:
	clean_world_objects()
	if lifes == 0:
		update_endgame_score()
		get_tree().change_scene_to_file(Util.END_SCENE)
	else:
		await dead_screen.start_countdown()
		world_spawn.game_setup()
		reset_player()

# Updates score variables to be displayed in end screen
func update_endgame_score() -> void:
	Util.player_score = score
	if score >= UtilGameSettings.winning_score:
		Util.player_has_won = true
	else:
		Util.player_has_won = false

# Resets the player starting position and puts it in the middle
func reset_player() -> void:
	player.position = _starting_position
	player.current_lane_position = 1
	

# Cleans all objects added in runtime
func clean_world_objects() -> void:
	for n in world_spawn.get_children():
		# safely cleans up
		n.call_deferred('free')
		n.queue_free()

