extends Control

const FIRST_LEVEL_PATH = "res://Map/Level_0.tscn"

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file(FIRST_LEVEL_PATH)

func _on_quit_button_pressed() -> void:
	# Close the game
	get_tree().quit()
