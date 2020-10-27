extends Node2D

# Variables to initialize what object to follow
onready var follow_char
enum state{
	HOLD,
	THROW,
	DROPPED,
	RETURN
}
# variable to hold the current state of the torch
var currentState
# the position for the torch to return to when the player is holding the torch
var startPosition
var holdPosition
# the position the torch is traveling to
var throwPosition = null
# throw speed
var throwSpeed = 4
# return speed
var returnSpeed = throwSpeed * 4
# time for linear interpolation
var t = 0
var displacement: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	follow_char = get_node("../Player");
	currentState = state.HOLD
	startPosition = follow_char.position + position
	print("torch position is: ")
	print(position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (Input.is_action_just_pressed("throw")):
		if(currentState == state.HOLD):
			currentState = state.THROW
			var mousePos = get_global_mouse_position()
			throwPosition = mousePos
		elif(currentState == state.DROPPED):
			currentState = state.RETURN
		print(currentState)
	
	holdPosition = follow_char.position + startPosition
	
	match(currentState):
		state.HOLD:
			position = holdPosition
			pass
		state.THROW:
			if(throwPosition != null):
				t = delta * throwSpeed
				position = position.linear_interpolate(throwPosition, t)
				
				if(_close_points(position, throwPosition)):
					currentState = state.DROPPED
					t = 0
					print("dropped")
		state.DROPPED:
			pass
		state.RETURN:
			t = delta * returnSpeed
			position = position.linear_interpolate(holdPosition, t)
			if(_close_points(position, holdPosition)):
				t = 0
				currentState = state.HOLD
			pass
		_:
			pass

func _close_points(p1, p2):
	return p1.distance_to(p2) < 5
