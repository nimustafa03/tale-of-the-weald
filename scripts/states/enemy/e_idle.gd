extends eState

##State Dictionary
@export var pursue_state : State

func _enter():
	super()
	parent.velocity = Vector3.ZERO

func process_physics(delta) -> pState:
	parent.velocity.y -= gravity*delta
	parent.move_and_slide()
	return null


func _on_scan_sphere_area_entered(area):
	if area is HitboxComponent:
		parent.state_machine.change_state(pursue_state)
	return self
