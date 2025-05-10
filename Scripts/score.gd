extends Node2D

@onready var ones: Sprite2D = $Sprite2D
@onready var tens: Sprite2D = $Sprite2D2
@onready var hundreds: Sprite2D = $Sprite2D3
@onready var thousands: Sprite2D = $Sprite2D4

const _0 = preload("res://Assets/sprites/0.png")

var digit1
var digit2
var digit3
var digit4

func _on_world_increase_point() -> void:
	Global.score += 1
	if Global.score < 10:
		digit1 = "res://Assets/sprites/{0}.png".format([str(Global.score)])
	elif Global.score < 100 and Global.score >= 10:
		digit1 = "res://Assets/sprites/{0}.png".format([str(Global.score)[-1]])
		digit2 = "res://Assets/sprites/{0}.png".format([str(Global.score)[-2]])
	elif Global.score < 1000 and Global.score >= 100:
		digit1 = "res://Assets/sprites/{0}.png".format([str(Global.score)[-1]])
		digit2 = "res://Assets/sprites/{0}.png".format([str(Global.score)[-2]])	
		digit3 = "res://Assets/sprites/{0}.png".format([str(Global.score)[-3]])	
	elif Global.score < 10000 and Global.score >= 1000:
		digit1 = "res://Assets/sprites/{0}.png".format([str(Global.score)[-1]])
		digit2 = "res://Assets/sprites/{0}.png".format([str(Global.score)[-2]])	
		digit3 = "res://Assets/sprites/{0}.png".format([str(Global.score)[-3]])	
		digit4 = "res://Assets/sprites/{0}.png".format([str(Global.score)[-4]])	
	ones.texture = load(digit1)
	if digit2:
		tens.texture = load(digit2)
	if digit3:
		hundreds.texture = load(digit3)
	if digit4:
		thousands.texture = load(digit4)


func _on_world_game_over() -> void:
	tens.texture = null
	hundreds.texture = null
	thousands.texture = null
	ones.texture = _0
