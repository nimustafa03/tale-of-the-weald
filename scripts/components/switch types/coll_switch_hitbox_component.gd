extends HitboxComponent
class_name CollisionSwitchHitboxComponent

@export var AFFECTED_COLLISION : Node3D

func receive_attack(attack : Attack):
	AFFECTED_COLLISION.switch(true) ## Esto permite que cada obstaculo haga cosas particulares al desactivarse, como reproducir una animación. true apaga, false enciende.
	
	## Como base, estos switches desactivan permanentemente la colisión, pero podríamos hacer clases que hereden de esta que ejecuten, además, lógica que permita reactivar la colisión al volver a atacar la hitbox, o que reactiven la colisión pasado un tiempo.
