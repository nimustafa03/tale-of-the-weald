extends eState

##State Dictionary
@export var idle_state : State
@export var attack_state : State

func _enter():
	super()


func process_physics(delta) -> pState:
	parent.velocity.y -= gravity*delta
	parent.move_and_slide()
	return null

func process_frame(delta):
	parent.velocity = Vector3.ZERO
	parent.nav_agent.set_target_position(parent.player.global_transform.origin)
	var next_nav_point = parent.nav_agent.get_next_path_position()
	parent.velocity = (next_nav_point - parent.global_transform.origin).normalized() * parent.IDLE_SPEED
	parent.look_at(Vector3(parent.player.global_position.x,parent.global_position.y,parent.player.global_position.z), Vector3.UP)
	parent.move_and_slide()


func _on_scan_sphere_area_exited(area):
	if area is HitboxComponent:
		parent.state_machine.change_state(idle_state)
