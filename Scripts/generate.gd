#@tool
extends Node2D

@onready var pipe_timer : Timer = $"Pipe Timer"
@onready var marker_2d: Marker2D = $Marker2D
@onready var bird: CharacterBody2D = $Bird

const GREEN_PIPE_DOWN = preload("res://Scenes/Environment/green_pipe_down.tscn")
const GREEN_PIPE_UP = preload("res://Scenes/Environment/green_pipe_up.tscn")

var last_pos : Vector2 
var first_pos : Vector2 
var pipes = []

signal increase_point
signal game_over
signal jump

func _ready() -> void:
	pipe_timer.start()
	bird.jump.connect(jumped)
	
func _on_pipe_timer_timeout() -> void:
	generate_pipe(marker_2d.position)

func jumped():
	jump.emit()
	 
func generate_pipe(pos:Vector2):
	var up = GREEN_PIPE_UP.instantiate()
	var down = GREEN_PIPE_DOWN.instantiate()
	
	var random_gap = [randi_range(50, 200), randi_range(30, 100), randi_range(30, 100)].pick_random()
	var random_offset = randi_range(100, 250)

	up.position = pos + Vector2(0, -random_gap - random_offset - 112)
	down.position = pos + Vector2(0, -random_offset - 56)
	down.increase_point.connect(on_increase_point)
	down.game_over.connect(on_game_over)
	up.game_over.connect(on_game_over)
	var check_for_point : CollisionShape2D = down.get_child(-1).get_child(0)
	check_for_point.shape.a.y = -random_gap * 10
	
	add_child(up)
	add_child(down)
	pipes.append(up)
	pipes.append(down)
	
func on_increase_point():
	increase_point.emit()
	
func on_game_over():
	game_over.emit()
	$Bird.initial_position()
	for pipe in pipes:
		if pipe:
			pipe.queue_free()
	pipes = []
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Bird":
		game_over.emit()
		$Bird.initial_position()

	
