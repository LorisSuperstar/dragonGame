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
		$CollisionShape2D.position.x = -110.5
	else: 
		velocity.x = -SPEED
		$Sprite2D.flip_h = true
		$CollisionShape2D.position.x = 112.0
	
	move_and_slide()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	if body.name == "Player":
		is_dead = true
		print("The Player jumped on me!")
		$CollisionShape2D.set_deferred("disabled", true)
		$Dead.play()
		hide()
		await $Dead.finished
		queue_free()


func _on_timer_timeout() -> void:
	print("turn around")
	is_going_right = !is_going_right
