extends Area2D

func _on_area_body_enter(body):
	if body.get_name() == 'Player':
		if Input.is_action_pressed('interact'):
			print('interact')
	pass;
