extends CollisionSwitchHitboxComponent

@export var RESTART_WAIT_TIME = 4.0

func receive_attack(attack : Attack):
	if !AFFECTED_COLLISION.isDisabled:
		AFFECTED_COLLISION.switch(true)
		await get_tree().create_timer(RESTART_WAIT_TIME).timeout
		AFFECTED_COLLISION.switch(false)
