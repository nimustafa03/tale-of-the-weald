extends State
class_name eState

##Variable exportables
@export var gravity : float = 50
@export var move_speed : float
@export var animation_name : String
@export var slide : float

var player = null
var parent : Enemy

func _enter():
	if (animation_name):
		parent.animations.play(animation_name)
