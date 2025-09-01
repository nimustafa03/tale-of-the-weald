extends State
class_name eState

##Variable exportables
@export var gravity : float
@export var move_speed : float
@export var animation_name : String
@export var slide : float

var parent : Enemy

func _enter():
	parent.animations.play(animation_name)
