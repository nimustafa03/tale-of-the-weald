extends CharacterBody3D
class_name Player

@onready var animations : AnimatedSprite3D = $AnimatedSprite3D
@onready var stateMachine : Node = $pStateMachine
@onready var springPivot : Node3D = $SpringArmPivot
@onready var healthComponent : HealthComponent = $HealthComponent
@onready var collectableComponent : CollectableComponent = $CollectableComponent
@onready var camera : Camera3D = $springPivot3D/Camera3D
@onready var sporeAttackScene = load("res://scenes/spore_attack.tscn")
@onready var sporeAttackCooldown = $SporeAttackCooldown
#@onready var pauseMenu = $PauseMenu
@onready var shadow_ray = $ShadowRay
@onready var shadow_decal : Decal = $ShadowDecal
@onready var collectable_component = $CollectableComponent

var was_on_floor : bool = false

@export var DEATH_STATE: pState 

@onready var original_sprite_scale : Vector3 = animations.scale

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	stateMachine.init(self)
	

func _unhandled_key_input(event):
	stateMachine.process_input(event)

func _input(event):
	if event.is_action_pressed("game_attack"):
		if sporeAttackCooldown.is_stopped():
			spore_attack()
		

func update_shadow_logic():
	shadow_ray.force_shapecast_update()
	
	if shadow_ray.is_colliding():
		shadow_decal.visible = true
		
		var collision_point = shadow_ray.get_collision_point(0)
		
		shadow_decal.global_position.y = collision_point.y + 0.1
		
		var distance = global_position.y - collision_point.y
		shadow_decal.albedo_mix = lerp(1.0, 0.0, clamp(distance / 10.0, 0.0, 1.0))
		
		var target_size = lerp(1.5, 0.5, clamp(distance / 10.0, 0.0, 1.0))
		shadow_decal.size.x = target_size
		shadow_decal.size.z = target_size
	else:
		shadow_decal.visible = false


func _physics_process(delta):
	stateMachine.process_physics(delta)
	
	#Actualiza la sombra del PJ
	update_shadow_logic()
	
	# Squash
	if is_on_floor() and not was_on_floor:
		apply_squash_and_stretch(Vector3(1.3, 0.8, 1.4))
	
	was_on_floor = is_on_floor()

func _process(delta):
	stateMachine.process_frame(delta)

func die():
	stateMachine.change_state(DEATH_STATE)

##movimientos de cámara
var is_camera_moving : bool = false


func set_active(active):
	set_physics_process(active)
	set_process(active)
	set_process_input(active)
	set_process_unhandled_key_input(active)

func apply_squash_and_stretch(target_modifier: Vector3, duration_in: float = 0.1, duration_out: float = 0.2):
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_OUT)
	
	var target_scale = original_sprite_scale * target_modifier
	
	tween.tween_property(animations, "scale", target_scale, duration_in)
	tween.tween_property(animations, "scale", original_sprite_scale, duration_out)

func spore_attack():
	sporeAttackCooldown.start()
	var attack_instance = sporeAttackScene.instantiate()
	add_child(attack_instance)
	attack_instance.position = Vector3.ZERO
	await get_tree().create_timer(1).timeout
	attack_instance.queue_free()
	
