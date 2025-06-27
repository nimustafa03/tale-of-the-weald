extends pState

##Diccionario de estados
@export var fall_state : pState
@export var run_state : pState

func _enter():
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0

func process_physics(delta) -> pState:
	parent.velocity.y -= gravity*delta
	parent.move_and_slide()
	if !parent.is_on_floor():
		return fall_state
	return null

func process_input(_event) -> pState:
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		parent.velocity.y = jump_speed
		return fall_state
	if Input.is_action_just_pressed("moveforward") or Input.is_action_just_pressed("moveback") or Input.is_action_just_pressed("moveleft") or Input.is_action_just_pressed("moveright"):
		return run_state
	return null
