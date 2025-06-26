extends CharacterBody3D
class_name Player

@onready var animations = $AnimatedSprite3D
@onready var state_machine = $pStateMachine
@onready var springArm3D = $SpringArm3D
@onready var healthComponent = $HealthComponent

func _ready():
	state_machine.init(self)

func _unhandled_key_input(event):
	state_machine.process_input(event)

func _physics_process(delta):
	state_machine.process_physics(delta)

func _process(delta):
	state_machine.process_frame(delta)

func die():
	state_machine.die()
