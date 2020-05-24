extends StaticBody2D

var target
var target_vector : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	target_vector = Vector2(0.0,0.0)
	idle()

func in_range(body, enter):
	if enter:
		target = body
	else:
		target = null

func see(body):
	if target != null:
		var space_state = get_world_2d().direct_space_state
		var result = space_state.intersect_ray(position, body.position, [self], collision_mask)
		if body == result.collider:
			return true
	return false

func chase(vector : Vector2):
	pass

func idle():
	pass

func _physics_process(delta):
	if see(target):
		target_vector = (target.position - position).normalized()
		chase(target_vector)
	else:
		target_vector = Vector2(0.0,0.0)
		idle()
	

