extends Area2D

var activated = false

func _on_body_entered(body: Node2D) -> void:

	if body.name == "Player" and not activated:
		activated = true
		body.global_position_checkpoint = global_position
