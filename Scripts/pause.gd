extends Node2D

signal pause

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause.emit()


func _on_button_pressed() -> void:
	pause.emit()
	$Button.release_focus()
