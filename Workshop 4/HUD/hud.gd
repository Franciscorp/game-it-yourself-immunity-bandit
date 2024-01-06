extends CanvasLayer
class_name HUD

# sprite on HUD that enable and disable
@onready var score_label = %Score
@onready var life_loss_1 = %LifeLoss1
@onready var life_loss_2 = %LifeLoss2
@onready var life_loss_3 = %LifeLoss3

@onready var game : Node3D = $"../"


func _ready():
	# Connects the signals from game to this functions
	if !game.lives_changed.is_connected(update_lifes):
		game.lives_changed.connect(update_lifes)
	if !game.score_changed.is_connected(_update_score_label):
		game.score_changed.connect(_update_score_label)
	# Displays score has 0 in the start
	_update_score_label(0)


func _update_score_label(score):
	score_label.text = str("Points: ", score)
	
	
# Decrease one by one, whilee showing off the cross on top of the virus sprite
func update_lifes(lifes):
	if lifes == 2:
		life_loss_3.visible = true
	if lifes == 1:
		life_loss_2.visible = true
	if lifes == 0:
		life_loss_1.visible = true
