extends KinematicBody2D

var speed = 100;

func _ready():
	pass;
	
func _physics_process(delta):
	var velocity = Vector2();
	
	if (Input.is_action_pressed("up")):
		velocity.y -= 1;
	if (Input.is_action_pressed("left")):
		velocity.x -= 1;
	if (Input.is_action_pressed("down")):
		velocity.y += 1;
	if (Input.is_action_pressed("right")):
		velocity.x += 1;
	
	velocity = velocity.normalized();
	#Velocity y element divided by 2 to match isometric tiles
	#velocity.y /= 2;
	velocity = move_and_slide(velocity * speed);
	#look_at(get_global_mouse_position());
	pass;
