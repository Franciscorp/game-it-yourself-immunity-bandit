extends Node

# SCENE PATHS
const GAME_SCENE = "res://game/game.tscn"
const MENU_SCENE = "res://main_menu/menu.tscn"
const CREDITS_SCENE = "res://credits/credits.tscn"
const END_SCENE = "res://end_screen/end.tscn"

# DIALOGUE
const MAIN_DIALOGUE_PATH = "res://main_menu/dialogue/main.dialogue"
const MESSAGE_1_DIALOGUE_PATH = "res://main_menu/dialogue/game_1.dialogue"
const MESSAGE_2_DIALOGUE_PATH = "res://main_menu/dialogue/game_2.dialogue"
const FINAL_MESSAGE_DIALOGUE_PATH = "res://main_menu/dialogue/game_final.dialogue"
const INTRO_DIALOGUE = "introduction"
const GAME_1_DIALOGUE = "game_1"
const GAME_2_DIALOGUE = "game_2"
const GAME_FINAL_DIALOGUE = "game_final"

# STRINGS
const STR_SCORE : String = "SCORE: "
const STR_WON1 : String = "CONGRATULATIONS!"
const STR_WON2 : String = "You now have the knowledge to fight virus!"
const STR_LOST1 : String = "OHH NOOO! You didn't survive long enough!"
const STR_LOST2 : String = "I know that's not your best work. Go back in there and give it your all!"
const STR_FINAL_SCORE : String = "FINAL SCORE:"

# ANIMATIONS
const ANIM_GAME_INTRODUCTION = "game_introduction"
const ANIM_CREDITS = "credits_animation"
const ANIM_FAIL_ARRAY = [
	"first_fail_appear",
	"second_fail_appear",
	"third_fail_appear"
]

# VIRUS ANIMATIONS
const ANIM_VIRUS_IDLE = "idle"
const ANIM_VIRUS_ANGRY = "angry"
const ANIM_VIRUS_PIRATE = "pirate"

# IMAGE PATHS

# PLAYER VARIABLES
var player_has_visited_menu : bool = false
var player_has_won : bool = false
var player_score : int = 0
