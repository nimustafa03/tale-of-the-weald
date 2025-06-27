extends Label

@export var parent : Node
var spring_length : float

func _process(delta):
	spring_length = parent.spring_arm.spring_length
	text = "spring length: %s" %spring_length
