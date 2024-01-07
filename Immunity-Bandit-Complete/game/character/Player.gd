extends CharacterBody3D
class_name Player

const JUMP_VEL = 7

var current_lane_position  = 1
var lane_positions = [-3, 0, 3]
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Reference to its own parent
@onready var game = $"../../"
@onready var virus_animation = $AnimationPlayer


func _ready():
	# Plays animation that makes the virus "float" in the main menu
	virus_animation.play("Hover_Effect")


func _physics_process(delta):
	# On left, right, up key the action makes the virus move to the lane appointed
	if Input.is_action_just_pressed("move_left"):
		if current_lane_position  != 0:
			current_lane_position  -= 1
	if Input.is_action_just_pressed("move_right"):
		if current_lane_position  != 2:
			current_lane_position  += 1
	# If the virus is not "touching" the floor, it can't jump
	if Input.is_action_just_pressed("jump") && is_on_floor():
			velocity.y = JUMP_VEL
	
	# Lerp is a function that smooths the transition when changing lane
	# Lerp work with movement over time
	position.z = lerpf(position.z, lane_positions[current_lane_position ], delta * 15)
	velocity.y -= gravity * delta
	# Moves the body based on velocity
	move_and_slide()
		
		
