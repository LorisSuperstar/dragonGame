extends Area2D

# 1. Change PackedScene to a String file path
@export_file("*.tscn") var next_level_scene: String

func _on_body_entered(body: Node2D) -> void:
    if body.name.to_lower().begins_with("player"):
        print("Level Completed!")
        # 2. Change change_scene_to_packed to change_scene_to_file
        get_tree().change_scene_to_file(next_level_scene)