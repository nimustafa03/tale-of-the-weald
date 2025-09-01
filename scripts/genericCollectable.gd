extends Node
class_name GenericCollectable

@export var parent : StaticBody3D

func _on_collection_component_area_entered(area):
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		hitbox.collectable_component.addCollectableAmount("Primitive",1)
		parent.queue_free()
