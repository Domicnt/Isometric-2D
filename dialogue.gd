extends Area2D

var in_area = false;
var stage = 0;

onready var text = get_node("../Text");


func _input(event):
	if in_area:
		if event.is_action_pressed("interact"):
			stage += 1;
			match(stage):
				1:
					text.set_text("1");
				2:
					text.set_text("2");
				_:
					text.set_text("3");


func _on_Area2D_body_entered(body):
	if body.get_name() == 'Player':
		in_area = true;

func _on_Area2D_body_exited(body):
	if body.get_name() == 'Player':
		in_area = false;
