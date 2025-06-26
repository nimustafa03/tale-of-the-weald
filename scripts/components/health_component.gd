extends Node
class_name HealthComponent

@export var parent : Node3D

@export var max_health : float = 10
var health : float

func _ready():
	health = max_health

func damage(attack : Attack):
	health -= attack.attack_damage
	if health <= 0:
		parent.die()
