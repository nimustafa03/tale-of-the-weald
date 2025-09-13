extends eState

##States Dictionary
@export var pursuit_state : eState

func _enter():
	parent.velocity = Vector3.ZERO
	await parent.summon_attack(pursuit_state)



func process_physics(delta) -> pState:
	parent.velocity.y -= gravity*delta
	parent.move_and_slide()
	return null
