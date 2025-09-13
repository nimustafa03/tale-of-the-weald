extends Area3D

@onready var attack = $Attack

func _on_area_entered(area):
	if area is PlayerHitboxComponent:
		area.damage(attack)
