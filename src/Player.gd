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
	if Input.is_action_pressed("turn_light_red"):
		$Light.set_shader_color("red")
	if Input.is_action_pressed("turn_light_yellow"):
		$Light.set_shader_color("yellow")
	if Input.is_action_pressed("turn_light_blue"):
		$Light.set_shader_color("blue")
	if Input.is_action_just_pressed("cycle_light_color"):
		match $Light.current_color:
			"red":
				$Light.set_shader_color("yellow")
			"yellow":
				$Light.set_shader_color("blue")
			"blue":
				$Light.set_shader_color("red")

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
		body.in_range(self, true)


func _on_LightRange_body_exited(body):
	if "Enemy" in body.name:
		print(body.name + " leaved.")
		body.in_range(self, false)

func set_color(color : String):
	var color_vec
	if color == "red":
		color_vec = Vector3(256,0,0)
	
	if color == "blue":
		color_vec = Vector3(0,0,256)

	if color == "yellow":
		color_vec = Vector3(128,128,0)
