extends Area3D
class_name HitboxComponent

@export var health_component : HealthComponent
@export var collectable_component : CollectableComponent
@export var parent : Node3D


func damage(attack : Attack):
	if health_component:
		health_component.damage(attack)
	
