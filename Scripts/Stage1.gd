extends Node2D
var asteroid_scene = preload("res://Scenes/Asteroid.tscn")
const screen_hight = 180

func _on_AsteroidSpawn_timeout():
	var asteroid_instance = asteroid_scene.instance()
	var y = rand_range(0,screen_hight)
	var x = $AsteroidPosition.position.x
	asteroid_instance.position = Vector2(x,y)
	add_child(asteroid_instance)
