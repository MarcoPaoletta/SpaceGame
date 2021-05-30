extends Sprite

const screen_width = 320 
const move_speed = -80

func _process(_delta):
	position += Vector2(move_speed * _delta, 0)
	if position.x <= -screen_width:
		position.x += screen_width
