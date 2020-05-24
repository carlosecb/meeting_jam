extends Node2D

func _on_Player_player_killed():
	SceneTransition.change_scene("res://Node2D.tscn")
