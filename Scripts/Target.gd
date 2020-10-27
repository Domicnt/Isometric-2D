extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var offset: Vector2
var temp: Vector2
onready var target = get_node("../Target")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):

	pass

	
func _process(delta):
	if Input.is_action_pressed("mouse_move"):
		offset = get_global_mouse_position()
		#print(get_global_mouse_position())
	target.position = offset
	# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
