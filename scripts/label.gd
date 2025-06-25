extends Label

@export var parent : Node
var current_state : pState


func _process(delta):
	current_state = parent.current_state
	current_state = parent.current_state
	text = "current state: %s" %current_state
