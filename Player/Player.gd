extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700
var big = true

func _physics_process(delta: float) -> void:
	velocity.x = 0
	
	if big == true:
		make_normal_size()
	else:
		make_smaller()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Jump.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed("go_left"):
		velocity.x = -SPEED
		$Sprite2D.flip_h = false
	if Input.is_action_pressed("go_right"):
		velocity.x = SPEED
		$Sprite2D.flip_h = true
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Ofenkäse_Enemy" or body.name == "rbs_enemy" or body.name == "rbs_enemy_tscn":
		if big == true:
			big = false
		else:
			print("dead now?")
			hide()
			var camera = get_node_or_null("Camera2D")
			remove_child(camera)
			$CollisionShape2D.set_deferred("disabled", true)
			$Dead.play()
			await $Dead.finished
			queue_free()
func make_normal_size() -> void:
	scale = Vector2(0.2, 0.2)
	big = true
func make_smaller() -> void:
	scale = Vector2(0.2, 0.1)
	big = false
