extends CharacterBody2D

class_name PlayerCharacter

const SPEED = 300.0

signal shoot(bullet, direction, location)
var Bullet = preload("res://scripts/weapon/Bullet.tscn")
var is_mouse_press_registered: bool = false

func _physics_process(delta):

	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && !is_mouse_press_registered:
		shoot.emit(Bullet, rotation, position)
		is_mouse_press_registered = true
	elif !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && is_mouse_press_registered:
		is_mouse_press_registered = false

	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	var direction = Vector2(horizontal_direction, vertical_direction)
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity * move_toward(velocity.length(), 0, SPEED)

	move_and_slide()
