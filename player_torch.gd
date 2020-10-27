extends Position2D

# Variables to initialize what object to follow
onready var follow_char
enum state{
	HOLD,
	THROW,
	DROPPED
}
var currentState

# Called when the node enters the scene tree for the first time.
func _ready():
	follow_char = get_node("../Player");
	currentState = state.HOLD
	#print("torch position is: ")
	#print(position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match(currentState):
		state.HOLD:
			pass
		state.THROW:
			pass
		state.DROPPED:
			pass
		_:
			pass

func _input(event):
	#print("torch position is: ")
	#print(position)
	pass
