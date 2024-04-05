extends CharacterBody2D


const SPEED = 300.0

var ray_cast: RayCast2D

func _ready():
	ray_cast = find_child("RayCast2D")

func _physics_process(delta):

	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)

	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	var direction = Vector2(horizontal_direction, vertical_direction)
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity * move_toward(velocity.length(), 0, SPEED)

	move_and_slide()
