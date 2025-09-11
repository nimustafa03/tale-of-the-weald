extends Node
class_name Enemy

@onready var animations = $AnimatedSprite3D
@onready var state_machine = $StateMachine
@onready var healthComponent = $HealthComponent
@export var deathstate : State

var player = null
@export var player_path : NodePath

var IDLE_SPEED = 5.0  ##In the future, it could be good to either set this to zero or not include it at all, as to allow different speeds for different enemies. 
var PURSUIT_SPEED = 7.0


@onready var nav_agent = $NavigationAgent3D 

func _ready():
	player = get_node(player_path) 
	state_machine.init(self)

func _unhandled_key_input(event):
	state_machine.process_input(event)

func _physics_process(delta):
	state_machine.process_physics(delta)

func _process(delta):
	state_machine.process_frame(delta)

func die():
	state_machine.change_state(deathstate)
