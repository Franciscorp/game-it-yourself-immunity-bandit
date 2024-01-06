extends Node

@onready var credits_anim_player : AnimationPlayer = $CreditsAnimationPlayer

# When the scene starts, start playing the which animation (running from side to side)
func _ready():
	credits_anim_player.play(Util.ANIM_CREDITS)

# When the player presses the go back to menu button, change scene to menu
func _on_btn_back_to_menu_pressed():
	# Audio from click sound plays
	SoundManager.instance.play_click_sfx()
	
	get_tree().change_scene_to_file(Util.MENU_SCENE)

