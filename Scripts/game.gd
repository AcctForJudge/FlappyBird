extends Node2D

@onready var game_over: Node2D = $"UI/Game Over"
@onready var start: Node2D = $UI/Start
@onready var label: Label = $UI/CenterContainer/Label
@onready var rich_text_label: RichTextLabel = $UI/Pause/RichTextLabel
var paused:bool = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.playing == false and Input.is_anything_pressed() and not paused:
		Global.playing = true
		start.visible = false
		label.visible = false
		game_over.visible = false
		

func _on_world_game_over() -> void:
	Global.playing = false
	game_over.visible = true
	label.visible = true
	Global.score = 0
	
	


func _on_pause_pause() -> void:
	Global.playing = not Global.playing
	rich_text_label.visible = !rich_text_label.visible
	paused = !paused
	  
	
