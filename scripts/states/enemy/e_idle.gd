extends eState

var parent : Player

##Diccionario de estados
@export var pursue_state : State
@export var attack_state : State

var gravity :float = 50

func _enter():
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0

func process_physics(delta) -> pState:
	parent.velocity.y -= gravity*delta
	parent.move_and_slide()
	return null
