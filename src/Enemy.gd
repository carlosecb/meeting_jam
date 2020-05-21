extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var target

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.visible = false

func in_range(body, enter):
	if enter:
		target = body
	else:
		target = null

func see(body):
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(position, body.position, [self], collision_mask)
	if body == result.collider:
		return true
	return false

func _physics_process(delta):
	if target != null:
		if see(target):
			$Sprite.visible = true
		else:
			$Sprite.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
