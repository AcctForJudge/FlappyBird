extends StaticBody2D

signal increase_point
signal game_over

var prev = Vector2(INF, 0)


func _process(delta: float) -> void:
	if Global.playing:
		position.x -= Global.scroll_speed * delta
		if prev.x < position.x:
			queue_free()
		prev = position


func _on_area_2d_body_entered(_body: Node2D) -> void:
	game_over.emit()


func _on_point_check_body_entered(_body: Node2D) -> void:
	increase_point.emit()
