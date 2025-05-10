extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var jumping : bool = false

signal jump

func _process(delta: float) -> void:
	position.x = 589.0
	if Global.playing:
		velocity += get_gravity() * delta
		
		if Input.is_action_just_pressed("jump"):
			jump.emit()
			velocity.y = - 250  
			animated_sprite_2d.play("flap")
			jumping = true
		if not jumping:
			rotation = lerp(rotation, PI / 4, 0.025)
		else:
			rotation = lerp(rotation, - PI / 4, 0.1)

		move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	if jumping:
		jumping = false
		animated_sprite_2d.play("fall")


func initial_position():
	global_position = Vector2(589, -316)
	rotation = 0
