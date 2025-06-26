extends pState

func _enter():
	super()

func process_physics(delta) -> pState:
	parent.velocity = Vector3(move_toward(parent.velocity.x,0,0.5), parent.velocity.y, move_toward(parent.velocity.z,0,0.5))
	parent.velocity.y -= gravity*delta
	parent.move_and_slide()
	return null
