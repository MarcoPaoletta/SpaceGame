extends Area2D

const move_speed = 150
const screen_width = 320
const screen_hight = 180
var can_shoot = true
var BULLETSCENE = preload("res://Scenes/Bullet.tscn")
var explosion_scene = preload("res://Scenes/Explosion.tscn")

func _ready():
	OS.center_window()
	
func _process(_delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction.y = -1
	if Input.is_action_pressed("down"):
		direction.y = 1
	if Input.is_action_pressed("right"):
		direction.x = 1
	if Input.is_action_pressed("left"):
		direction.x = -1
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()
		
	if direction.length() > 0:
		direction = direction.normalized()
	
	position.x = clamp(position.x,0,screen_width)
	position.y = clamp(position.y,0,screen_hight)
	position += move_speed * direction * _delta
	
func shoot():
	can_shoot = false
	var bullet_instance = BULLETSCENE.instance()
	bullet_instance.position = position
	get_parent().add_child(bullet_instance)
	$Timer.start()


func _on_Timer_timeout():
	can_shoot = true
	$Timer.stop()


func _on_Player_area_entered(area):
	if area.is_in_group("asteroid"):
		var explosion_instance = explosion_scene.instance()
		explosion_instance.position = position
		get_parent().add_child(explosion_instance)
		queue_free()
		get_tree().reload_current_scene()
