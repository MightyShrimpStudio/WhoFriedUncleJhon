extends Node

var playerCharacter: PlayerCharacter

func _ready():
	playerCharacter = find_child("PlayerCharacter")
	playerCharacter.shoot.connect(_on_player_shoot)

func _on_player_shoot(Bullet, direction, location):
	var spawned_bullet = Bullet.instantiate()
	add_child(spawned_bullet)
	spawned_bullet.rotation = direction
	spawned_bullet.position = location
	spawned_bullet.velocity = spawned_bullet.velocity.rotated(direction)
