extends Node2D

class_name WeaponBase

var rayCast: RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready():
	rayCast = find_child("RayCast2D")
	
func shoot():
	print("shoot")
