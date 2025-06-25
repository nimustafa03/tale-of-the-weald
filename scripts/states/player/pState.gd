extends Node
class_name pState ##p(layer)State


##Variables Exportadas

@export var animation_name : String
@export var move_speed : float = 7.5
@export var slide : float = 4
@export var jump_speed : float = 30
@export var gravity : int = 50

##Referencias a objetos usados
var parent : Player

func _enter():
	parent.animations.play(animation_name)

func _exit():
	pass

func process_frame(delta) -> pState:
	return null

func process_physics(delta) -> pState:
	return null

func process_input(event) -> pState:
	return null

func InputMove(delta, spring_arm : SpringArm3D):
	var input = Input.get_vector("moveleft","moveright","moveforward","moveback")
	var direction = Vector3(input.x,0,input.y).rotated(Vector3.UP, spring_arm.rotation.y)
	parent.velocity = lerp(parent.velocity, direction * move_speed, slide * delta)

func flipSprite():
	if Input.is_action_pressed("moveleft") or Input.is_action_just_released("moveleft"):
		parent.animations.flip_h = true
	if Input.is_action_just_pressed("moveright") or Input.is_action_just_released("moveright"):
		parent.animations.flip_h = false
