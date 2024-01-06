extends Node

# Singleton class for managing game sounds

# Note, this class is called a singleton and it's a concept hard to understand, 
# but in simpler terms for this project think of this sound manager like this:

# In programming, a singleton is piece of code that no matter where you use it in the program, 
# there's only ever one of it.
# So, a singleton is a way to make sure there's only one of something important, 
# just like our one unique sound manager that contains all the sounds in the game.
# This is important to help the game running smoothly and run in many computers

# Dictionary to store each SoundPlayer nodes by its name
var _sound_player_by_name : Dictionary = {}

# Reference to the itself, ensuring only one exists
var instance : Node

# Constant Names for nodes with audio
# SFX -> Sound Effects

# Menu Audios
const MENU_MUSIC = "menu_music"
const WITCH_LAUGH_SFX = "witch_laugh_sfx"
const FIRE_SFX = "fire_sfx"
const BUBBLES_SFX = "bubbles_sfx"

# Game Audios
const GAME_MUSIC = "game_music"
const CLICK_SFX = "click_sfx"
const CORRECT_SFX = "correct_sfx"
const ERROR_SFX = "error_sfx"


func _ready():
	# Store itself to be avaiable in instance. this is used to call functions
	# of the script
	instance = self
	
	# Menu Audios
	add_to_sound_player_dictionary(MENU_MUSIC, $MenuMusic/MenuMusic)
	add_to_sound_player_dictionary(WITCH_LAUGH_SFX, $MainMenuAudio/WitchLaugh)
	add_to_sound_player_dictionary(FIRE_SFX, $MainMenuAudio/Fire)
	add_to_sound_player_dictionary(BUBBLES_SFX, $MainMenuAudio/Bubbles)

	# Game Audios
	add_to_sound_player_dictionary(GAME_MUSIC,$GameMusic/GameMusic)
	add_to_sound_player_dictionary(CLICK_SFX, $UIAudio/Click)
	add_to_sound_player_dictionary(CORRECT_SFX, $UIAudio/Correct)
	add_to_sound_player_dictionary(ERROR_SFX, $UIAudio/Error)
	

func add_to_sound_player_dictionary(node_name, node):
	# Add the node to the sound player dictionary
	# This works as a list with a name to each sound, so you can get it later
	_sound_player_by_name[node_name] = node


# A generic function that plays the request audio if avaiable
func play_audio(audio_name):
	# Get the "audio_name" node if it exists and is an AudioStreamPlayer
	var audio_node = _sound_player_by_name.get(audio_name)
	
	if audio_node != null:
		# If audio_node exists and is not playing already, play audio
		if !audio_node.is_playing():
			audio_node.play()
	
	
# Stop all menu music
func stop_menu_audio():
	# Gets all the keys(names of audio_nodes) of the sound player dictionary
	var _sound_player_keys = Array(_sound_player_by_name.keys())
	
	# Gets each sound player from the dictionary and stops the each audio
	for i in _sound_player_keys:
		_sound_player_by_name.get(i).stop()
	
# GAME Audio
func play_game_music():
	play_audio(GAME_MUSIC)
	
# UI Audio
func play_click_sfx():
	play_audio(CLICK_SFX)
	
func play_correct_sfx():
	play_audio(CORRECT_SFX)
	
func play_error_sfx():
	play_audio(ERROR_SFX)
	
# Menu Audio
# Plays the menu music if it exists
func play_menu_music():
	play_audio(MENU_MUSIC)
	
func play_witch_laugh_sfx():
	play_audio(WITCH_LAUGH_SFX)

func play_fire_sfx():
	play_audio(FIRE_SFX)
	
func play_bubbles_sfx():
	play_audio(BUBBLES_SFX)
		
		

