extends Node2D
@onready var layer : CanvasLayer= $Control/CanvasLayer
func _input(event):
	if event.is_action_pressed("ui_cancel") and !get_tree().paused:
		pause()
	elif event.is_action_pressed("ui_cancel") and get_tree().paused:
		unpause()
		
		
func _on_quit_game_pressed() -> void:
	get_tree().quit()

func pause():
		get_tree().paused = true
		layer.show()
		show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func unpause():
	get_tree().paused = false
	layer.hide()
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
