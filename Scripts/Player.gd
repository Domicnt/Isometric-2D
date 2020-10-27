extends KinematicBody2D

var speed = 10;
onready var target = get_node("../Target")
var displacement: Vector2
func _ready():
	pass;
	
func _physics_process(delta):
	var velocity = Vector2();
	displacement = target.position-position
	#print(displacement)
	if displacement.length() < speed/10:
		displacement.x = 0
		displacement.y = 0
	if displacement.length() != 0:
		displacement = displacement.normalized()
	
	velocity = displacement

	
	#Velocity y element divided by 2 to match isometric tiles
	#velocity.y /= 2;
	velocity = move_and_slide(velocity * speed/2);
	#look_at(get_global_mouse_position());
	pass;
	velocity = move_and_slide(velocity * speed);
	#look_at(get_global_mouse_position());

func _input(event):
	pass;
	
