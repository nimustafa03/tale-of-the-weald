extends pState

##Diccionario de estados
@export var idle_state : pState
@export var fall_state : pState

##Referencia al SpringArm3D
@export var spring_arm : SpringArm3D

func _enter():
	super()

func process_physics(delta) -> pState:
	
	parent.velocity.y -= gravity*delta ##Gravedad
	
	InputMove(delta, spring_arm)
	
	if !parent.is_on_floor():
		return fall_state
	
	if !Input.is_anything_pressed():
		parent.velocity = Vector3(move_toward(parent.velocity.x,0,slide),parent.velocity.y,move_toward(parent.velocity.z,0,slide))
	
	
	parent.move_and_slide()
	if parent.velocity == Vector3(0,0,0) and !Input.is_anything_pressed():
		return idle_state
	return null

func process_frame(_delta):
	flipSprite()

func process_input(_event):
	if Input.is_action_just_pressed("jump"):
		parent.velocity.y = jump_speed
		return fall_state
