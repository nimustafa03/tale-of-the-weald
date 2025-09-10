extends CharacterBody3D
class_name Player

@onready var animations : AnimatedSprite3D = $AnimatedSprite3D
@onready var state_machine : Node = $pStateMachine
@onready var spring_arm : SpringArm3D = $SpringArm3D
@onready var healthComponent : HealthComponent = $HealthComponent
@onready var collectableComponent : CollectableComponent = $CollectableComponent

@export var pDie : pState 

func _ready():
	state_machine.init(self)

func _unhandled_key_input(event):
	state_machine.process_input(event)

func _physics_process(delta):
	state_machine.process_physics(delta)
	if Input.is_action_just_pressed("camera_moveleft"):
		rotate_camera("left")
	if Input.is_action_just_pressed("camera_moveright"):
		rotate_camera("right")
	if Input.is_action_just_pressed("camera_forward"):
		camera_zoom(false, delta)
	if Input.is_action_just_pressed("camera_back"):
		camera_zoom(true, delta)


func _process(delta):
	state_machine.process_frame(delta)

func die():
	state_machine.change_state(pDie)

##movimientos de cámara
var is_camera_moving : bool = false

func camera_zoom(direction : bool, delta : float):
	var increment = -5
	if direction == true:
		increment = -increment
	var max_zoom = 5
	var min_zoom = 15
	
	if (spring_arm.spring_length-0.5 >= max_zoom and increment < 0) or (spring_arm.spring_length+0.5 <= min_zoom and increment > 0):
		spring_arm.spring_length = move_toward(spring_arm.spring_length, spring_arm.spring_length+increment,0.5)

func rotate_camera(direction : String):
	var degs : float = +45
	if direction == "right":
		degs = -45
	if !is_camera_moving:
		is_camera_moving = true
		var camera_rotation_tween = create_tween()
		camera_rotation_tween.set_trans(Tween.TRANS_SINE)
		camera_rotation_tween.tween_property(spring_arm, 'rotation_degrees', Vector3(spring_arm.rotation_degrees.x, spring_arm.rotation_degrees.y -degs, spring_arm.rotation_degrees.z),0.5)
		await camera_rotation_tween.finished
		is_camera_moving = false
