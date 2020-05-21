extends Light2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func radium(x):
	var noise = sin(5.0*x)*cos(3.0*x);
	return noise;

func _process(delta):
	time += delta
	self.set_scale(Vector2(1.05,1.05) + 0.05*Vector2(1,1)*radium(0.4*time))