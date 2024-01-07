extends Control

@onready var counter_label : Label = $RestartCounter
@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Countdown before restarting game
var countdown : int = 3

func start_countdown() -> void:
	start_dead_screen()
	
	# Cycles until the countdown reachs 0, waiting one second each time 
	for i in range(countdown, -1, -1):
		await get_tree().create_timer(1).timeout
		countdown = countdown - 1
		change_label()
	
	reset_dead_screen()	

# Play animation that fades in the death screen and changes the label to start the countdown
func start_dead_screen() -> void:
	animation_player.play("fade_in")
	change_label()
	self.visible = true

# On the end of the countdown resets the data and visibility of the death screen
func reset_dead_screen() -> void:
	self.visible = false
	countdown = 3


# Updates screen text
# if countdown is 0, plays start and animation of dafe out
func change_label() -> void:
	if countdown == 0:
		animation_player.play("fade_out")
		counter_label.text = "START!"
	else:
		counter_label.text = str(countdown, "...")
