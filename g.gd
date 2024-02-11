extends Node

var GAME_SIZE:Vector2 = Vector2(500,500):
	set(val):
		GAME_SIZE = val
		ProjectSettings.set_setting("display/window/size/viewport_width", val.x)
		ProjectSettings.set_setting("display/window/size/viewport_height", val.y)

func _ready():
	GAME_SIZE = GAME_SIZE
