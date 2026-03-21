extends Node3D

class_name SwitchableObstacle

var isDisabled : bool = false


func switch(state : bool):
	for children in self.get_children(true):
		if children is CollisionShape3D:
			children.set_deferred("disabled", state)
		if children is MeshInstance3D:
			children.set_deferred("visible", !state)
	isDisabled = state
	
