extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

const gravity = 10
export (int) var speed = 100
export (int) var jump_power = -350
var on_glide = false
export (int) var glide = 20

var velocity = Vector2()

func get_input():
	velocity.x = 0
	if Input.is_action_pressed('right'):
		velocity.x = speed
	if Input.is_action_pressed('left'):
		velocity.x = -speed
	if Input.is_action_just_pressed('jump'):
		if is_on_floor():
			velocity.y = jump_power
		elif on_glide:
			on_glide = false
		elif (velocity.y >= 0) and (not on_glide):
			on_glide = true

func _physics_process(delta):
	get_input()
	if is_on_floor():
		on_glide = false
	if on_glide:
		velocity.y = glide
	else:
		velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0,-1))
