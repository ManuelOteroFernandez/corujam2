extends Sprite2D

@export var texture_active: Texture2D
@export var texture_inactive: Texture2D

func active(value:bool):
	if value:
		texture = texture_active
	else:
		texture = texture_inactive
