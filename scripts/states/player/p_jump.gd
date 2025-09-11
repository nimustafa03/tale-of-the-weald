extends pState

##Diccionario de estados
@export var idle_state : pState
@export var run_state : pState

##Referencia a SpringArm3D
@export var spring_arm : SpringArm3D

func _enter():
	super()

func process_physics(delta):
	parent.velocity.y -= gravity *0.75 * delta
	
	if !Input.is_action_pressed("jump"):
		parent.velocity.y -= gravity * delta
	if parent.velocity.y <= 0:
		parent.animations.play("fall")
		parent.velocity.y -= gravity *2 * delta
	
	InputMove(delta, spring_arm)
	
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if parent.velocity != Vector3(0,parent.velocity.y,0):
			return run_state
		else:
			return idle_state
	return null

func process_frame(_delta):
	flipSprite()
