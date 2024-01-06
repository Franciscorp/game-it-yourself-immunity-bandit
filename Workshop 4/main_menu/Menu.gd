extends Node

@onready var animation_player : AnimationPlayer = $Panel/AnimationPlayer
@onready var button_container : VBoxContainer = $Panel/VBoxContainer
@onready var virus : AnimatedSprite2D = $Panel/Virus
@onready var human : Sprite2D = $Panel/Human


func _ready() -> void: 
	assert(animation_player.animation_finished.connect(_anim_finished) == OK)
	assert(DialogueManager.dialogue_ended.connect(_on_dialogue_end) == OK)
	
	# When menu opens, starting playing the background music
	# SoundManager is the class that controls all the audio in the game
	# This class is pre loaded by the project and always ready to play the 
	# requested sound
	# As long as that sound exists and is ready to be played in the scene
	SoundManager.instance.play_menu_music()
	SoundManager.instance.play_witch_laugh_sfx()
	SoundManager.instance.play_fire_sfx()
	SoundManager.instance.play_bubbles_sfx()
	
	
	# If the player has never been in the main menu, play animation
	if !Util.player_has_visited_menu:
		animation_player.play(Util.ANIM_GAME_INTRODUCTION)
	else: 
		# else set everything in place as it was at the end of the animation
		virus.set_position(Vector2(360, 225)) 
		virus.animation = Util.ANIM_VIRUS_IDLE
		button_container.visible = true


# The following functions are connected via Godot's interface to be called upon 
# a certain action, for example: when the player clicks the start button.
# Therefore, each function is specific to one action, dealing with it accordingly. 
# When the player clicks the quit button, exit the game
func _on_quit_pressed() -> void:
	# Audio from click sound plays
	SoundManager.instance.play_click_sfx()
	get_tree().quit()


# When player clicks the credits button, go to the credits scene
func _on_credits_pressed():
	# Audio from click sound plays
	SoundManager.instance.play_click_sfx()
	
	get_tree().change_scene_to_file(Util.CREDITS_SCENE)


func _on_start_pressed():
	# Audio from click sound plays
	SoundManager.instance.play_click_sfx()
	# On starting game, stops all the audio from this scene
	SoundManager.instance.stop_menu_audio()
	
	get_tree().change_scene_to_file(Util.GAME_SCENE)

# this function is called from the dialogue and shows the human circulation
func _on_introduce_human():
	animation_player.play("human_appears")


func _anim_finished(animation_name):
	# If the introduction animation finished
	if animation_name == Util.ANIM_GAME_INTRODUCTION:
		# Start dialogue 
		DialogueManager.show_example_dialogue_balloon(load(Util.MAIN_DIALOGUE_PATH), Util.INTRO_DIALOGUE)
		animation_player.play("up_down")
		

func _on_dialogue_end(_arg): 
	Util.player_has_visited_menu = true
	button_container.visible = true

