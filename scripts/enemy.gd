extends InteractableEntity
class_name Enemy

@onready var animations = $AnimatedSprite3D
@onready var state_machine = $StateMachine
@onready var healthComponent = $HealthComponent
@onready var nav_agent = $NavigationAgent3D 
@export var DEATH_STATE : State




var player = null
@export var PLAYER_PATH : NodePath



func _ready():
	player = get_node(PLAYER_PATH) 
	state_machine.init(self)

func _unhandled_key_input(event):
	state_machine.process_input(event)

func _physics_process(delta):
	state_machine.process_physics(delta)

func _process(delta):
	state_machine.process_frame(delta)

func die():
	state_machine.change_state(DEATH_STATE)
