extends Node
class_name StateMachine

@export var initial_state : State
var current_state : State

func init(parent : CharacterBody3D):
	for child in get_children():
		if child is not Label:
			child.parent = parent
	change_state(initial_state)

func change_state(new_state : State):
	if current_state:
		current_state._exit()
	current_state = new_state
	current_state._enter()

func process_physics(delta):
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event):
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)
	##Cuando halla implementado el ataque como componente del jugador, va a ir acá.


func process_frame(delta):
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
