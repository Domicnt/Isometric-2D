extends Area2D

var in_area = false;
var lit = false;

var lit_sprite = preload("res://sprites/Lamp-lit.png");
var unlit_sprite = preload("res://sprites/Lamp-unlit.png");

onready var lamp_sprite = get_node("../lamp-sprite");
onready var lamp_light = get_node("../Light");

func _on_Area2D_body_entered(body):
	if body.get_name() == 'Player':
		in_area = true;

func _on_Area2D_body_exited(body):
	if body.get_name() == 'Player':
		in_area = false;

func _input(event):
	if in_area:
		if event.is_action_pressed("interact"):
			lit = !lit;
			if (lit):
				lamp_sprite.set_texture(lit_sprite);
				lamp_light.set_visible(true);
			else:
				lamp_sprite.set_texture(unlit_sprite);
				lamp_light.set_visible(false);


