extends Area2D

var velocity = Vector2.RIGHT * 100
var source: String

func _ready():
	body_entered.connect(on_hit)

func _physics_process(delta):
	position += velocity * delta
	
func on_hit(body: Node2D):
	if body.name != source:
		print(body.name)
		queue_free()
