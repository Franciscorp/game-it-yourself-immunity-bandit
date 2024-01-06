extends Node

@onready var win_or_lose_label = $Panel/VBoxContainer/MarginContainer/WinLoseLabel
@onready var win_or_lose_label2 = $Panel/VBoxContainer/Label
@onready var score_label = $Panel/VBoxContainer2/ScoreLabel

func _ready():
	if Util.player_has_won: 
		win_or_lose_label.text = Util.STR_WON1
		win_or_lose_label2.text = Util.STR_WON2
	else: 
		win_or_lose_label.text = Util.STR_LOST1
		win_or_lose_label2.text = Util.STR_LOST2
	
	score_label.text = Util.STR_FINAL_SCORE + " " + str(Util.player_score)


func _on_btn_back_to_menu_pressed():
	get_tree().change_scene_to_file(Util.MENU_SCENE)
