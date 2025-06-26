extends Node

@export var initial_state : pState
@export var spring_arm : SpringArm3D
@export var player : Player

var current_state : pState
var is_camera_moving : bool = false

func change_state(new_state : pState):
	if current_state:
		current_state._exit()
	current_state = new_state
	current_state._enter()

func init(parent : Player):
	for child in get_children():
		if child is not Label:
			child.parent = parent
	change_state(initial_state)

func process_physics(delta):
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
	if Input.is_action_just_pressed("camera_moveleft"):
		rotate_camera("left")
	if Input.is_action_just_pressed("camera_moveright"):
		rotate_camera("right")
	if Input.is_action_just_pressed("camera_forward"):
		camera_zoom(false, delta)
	if Input.is_action_just_pressed("camera_back"):
		camera_zoom(true, delta)

func camera_zoom(direction : bool, delta : float):
	var increment = -5
	if direction == true:
		increment = -increment
	var max_zoom = 5
	var min_zoom = 15
	
	if (spring_arm.spring_length-0.5 >= max_zoom and increment < 0) or (spring_arm.spring_length+0.5 <= min_zoom and increment > 0):
		spring_arm.spring_length = move_toward(spring_arm.spring_length, spring_arm.spring_length+increment,0.5)
	


func rotate_camera(direction : String):
	var degs : float = +45
	if direction == "right":
		degs = -45
	if !is_camera_moving:
		is_camera_moving = true
		var camera_rotation_tween = create_tween()
		camera_rotation_tween.set_trans(Tween.TRANS_SINE)
		camera_rotation_tween.tween_property(spring_arm, 'rotation_degrees', Vector3(spring_arm.rotation_degrees.x, spring_arm.rotation_degrees.y -degs, spring_arm.rotation_degrees.z),0.5)
		await camera_rotation_tween.finished
		is_camera_moving = false

func process_input(event):
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)
	##Cuando halla implementado el ataque como componente del jugador, va a ir acá.

func process_frame(delta):
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
