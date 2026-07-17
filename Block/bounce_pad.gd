extends Area2D

@export var bounce_force: float = -800.0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.velocity.y = bounce_force
		$BounceSound.play()
