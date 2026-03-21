extends CollisionSwitchHitboxComponent

func receive_attack(attack : Attack):
	AFFECTED_COLLISION.switch(!AFFECTED_COLLISION.isDisabled)
