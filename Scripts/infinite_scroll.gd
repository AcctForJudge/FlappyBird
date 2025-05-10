extends TileMapLayer

var tile_size: Vector2i 
var pos: float
func _ready() -> void:
	match name:
		"Background":
			tile_size = Vector2i(288,512)
		"Base":
			tile_size = Vector2i(336, 112)
func _process(delta):
	if Global.playing:
		pos = Global.scroll_speed * delta
		if name == "Background": 
			pos *= 0.5
		position.x -= pos
		if position.x <= -tile_size.x:
			position.x += tile_size.x  
