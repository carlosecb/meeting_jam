extends Control

func _ready():
	$Menu/CenterRow/Buttons/StartGame.grab_focus()

func _on_StartGame_pressed():
	SceneTransition.change_scene("res://scenes_and_scripts/Game.tscn")
