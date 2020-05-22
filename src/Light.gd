extends Light2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var time : float = 0.0

var current_color : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_shader_color(color : String):
	var color_vec : Vector3
	match color:
		"red":
			set_color(Color(1,0,0,1))
			color_vec = Vector3(256,0,0)
		"yellow":
			set_color(Color(1,1,0,1))
			color_vec = Vector3(128,128,0)
		"blue":
			set_color(Color(0,0,1,1))
			color_vec = Vector3(0,0,256)
	get_material().set_shader_param("color", color_vec)
	current_color = color
	print("Set color to " + color)

func radium(x : float) -> float:
	var noise : float = sin(5.0*x)*cos(3.0*x);
	return noise;

func _process(delta):
	time += delta
	self.energy = 0.85 + 0.15*radium(0.4*time)
	#self.set_scale(Vector2(1.05,1.05) + 0.05*Vector2(1,1)*radium(0.4*time))
