extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hearts = [
preload("res://assets/hud/heart_container/heart-0.png"),
preload("res://assets/hud/heart_container/heart-1.png"),
preload("res://assets/hud/heart_container/heart-2.png"),
preload("res://assets/hud/heart_container/heart-3.png"),
preload("res://assets/hud/heart_container/heart-4.png"),
preload("res://assets/hud/heart_container/heart-5.png"),
preload("res://assets/hud/heart_container/heart-6.png")
]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_health_changed(current_life : int):
	$Interface/Life.set_texture(hearts[current_life])
