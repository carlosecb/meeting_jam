extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var target
var block_color = "red"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
		if see(target) and target.compare_color(block_color):
			$LightOccluder2D.visible = false
			$Sprite.visible = false
		else:
			$LightOccluder2D.visible = true
			$Sprite.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
