extends StaticBody2D

@export var spawn_item_scene: PackedScene
@export var scale_x: float
@export var scale_y: float
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	animated_sprite.play("open")
	var item = spawn_item_scene.instantiate()
	item.scale = Vector2(scale_x, scale_y)
	item.position = global_position + Vector2(0, -30)
	get_parent().add_child(item)
	queue_free()
	
