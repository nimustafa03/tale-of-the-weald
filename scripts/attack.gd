extends Node
class_name Attack

@export var ATTACK_DAMAGE : float = 1


func _on_area_3d_area_entered(area: HitboxComponent) -> void:
	if area.PARENT is CharacterBody3D:
		area.damage(self)
