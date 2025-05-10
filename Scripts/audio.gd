extends Node2D

@onready var point: AudioStreamPlayer = $Point
@onready var hit: AudioStreamPlayer = $Hit
@onready var die: AudioStreamPlayer = $Die
@onready var wing: AudioStreamPlayer = $Wing


func _on_world_increase_point() -> void:
	point.play()


func _on_world_game_over() -> void:
	hit.play()
	die.play()
	
func _on_world_jump() -> void:
	wing.play()
