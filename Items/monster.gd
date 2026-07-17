extends CharacterBody2D

const SPEED = 100
var is_going_right = false
var is_dead = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		if is_going_right:
			position.x -=10
		else:
			position.x +=10
		
		velocity.y = 100
		is_going_right = !is_going_right
	if is_going_right == true: 
		velocity.x = SPEED
		$Sprite2D.flip_h = false
	else: 
		velocity.x = -SPEED
		$Sprite2D.flip_h = true
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	if body.has_method("make_normal_size"):
		is_dead = true
		body.make_normal_size()
		$CollisionShape2D.set_deferred("disabled", true)
		hide()
		$Dead.play()
		await $Dead.finished
		queue_free()


func _on_timer_timeout() -> void:
	print("turn around")
	is_going_right = !is_going_right
