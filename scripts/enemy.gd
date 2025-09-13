extends CharacterBody3D

@onready var animations = $AnimatedSprite3D
@onready var state_machine = $StateMachine
@onready var healthComponent = $HealthComponent
@onready var nav_agent = $NavigationAgent3D 
@onready var attack_range = $AttackRange
@export var deathstate : State


var attack_target : HitboxComponent
var attack_timer = 0.5
@onready var cooldown_timer = $CooldownTimer
@onready var attack = $Attack
var attack_ball = preload("res://scenes/attack_ball.tscn")


var player = null
@export var player_path : NodePath

var IDLE_SPEED = 5.0  ##In the future, it could be good to either set this to zero or not include it at all, as to allow different speeds for different enemies. 
var PURSUIT_SPEED = 7.0

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

func summon_attack(state : eState):
	await get_tree().create_timer(attack_timer).timeout
	var attack_ball_instance = attack_ball.instantiate()
	add_child(attack_ball_instance)
	attack_ball_instance.global_position = attack_range.global_position
	await get_tree().create_timer(1).timeout
	attack_ball_instance.queue_free()
	cooldown_timer.start()
	state_machine.change_state(state)
