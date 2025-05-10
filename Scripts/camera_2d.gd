extends Camera2D


func _process(_delta: float) -> void:
	if Input.is_physical_key_pressed(KEY_D):
		position.x += 50
	elif Input.is_physical_key_pressed(KEY_A):
		position.x -= 50
	if Input.is_physical_key_pressed(KEY_W):
		position.y -= 25
	elif Input.is_physical_key_pressed(KEY_S):
		position.y += 25
