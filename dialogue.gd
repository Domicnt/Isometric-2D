extends Area2D

var in_area = false;
var stage = 0;

onready var node = get_node("../Sprite2");
onready var text_node = get_node("../Sprite2/Text");
var text = "";

func _ready():
	var f = File.new();
	var err = f.open("res://Dialogue/" + self.name + ".txt", File.READ);
	if err != OK:
		printerr("Could not open file, error code ", err);
	text = f.get_as_text();
	f.close();

func _input(event):
	if in_area:
		if event.is_action_pressed("interact"):
			if stage == 0:
				node.set_visible(true);
			stage += 1;
			if text.split("\n").size() >= stage:
				var line = text.split("\n")[stage - 1];
				text_node.set_text(line);

func _on_Area2D_body_entered(body):
	if body.get_name() == 'Player':
		in_area = true;

func _on_Area2D_body_exited(body):
	if body.get_name() == 'Player':
		in_area = false;
