extends Node2D

# Variables to initialize what object to follow
onready var follow_char
enum state{
	HOLD,
	THROW,
	DROPPED
}
# variable to hold the current state of the torch
var currentState
# the position for the torch to return to when the player is holding the torch
var startPosition
# the position the torch is traveling to
var throwPosition = null

# Called when the node enters the scene tree for the first time.
func _ready():
	follow_char = get_node("../../Player");
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
			print(mousePos)
			throwPosition = Vector2(position.x + mousePos.x, position.y + mousePos.y)
		else:
			currentState = state.HOLD
		print(currentState)
	
	match(currentState):
		state.HOLD:
			position = startPosition
			pass
		state.THROW:
			if(throwPosition != null):
				if(position == throwPosition):
					currentState = state.DROPPED
			position = get_global_mouse_position()
		state.DROPPED:
			pass
		_:
			pass

func _input(event):
	pass
