extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Read.")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

const gravity = 10
export (int) var speed = 100
export (int) var jump_power = -250
export (int) var jump_extra = -5
var on_glide = false
export (int) var glide = 30

var velocity = Vector2()

func get_input():
	if is_on_floor():
		on_glide = false
		velocity.x = 0
	if Input.is_action_pressed('right'):
		velocity.x = speed
	if Input.is_action_pressed('left'):
		velocity.x = -speed
	if Input.is_action_just_pressed('jump'):
		if is_on_floor():
			velocity.y = jump_power
	if Input.is_action_pressed('jump'):
		if velocity.y < 0:
			velocity.y += jump_extra
		elif (velocity.y >= 0) and (not on_glide):
			on_glide = true
	if Input.is_action_just_released("jump"):
		if on_glide:
			on_glide = false

func _physics_process(delta):
	get_input()
	if on_glide:
		velocity.y = glide
	else:
		velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0,-1))


func _on_LightRange_body_entered(body):
	if "Enemy" in body.name:
		print(body.name + " found.")
		body.see(self)
