extends Node
class_name GenericCollectable

@export var parent : StaticBody3D
@export var collectableName : String = "Primitive"
@export var animations : AnimatedSprite3D


func _on_collection_component_area_entered(area):
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		if area.parent is Player:
			hitbox.collectable_component.addCollectableAmount(collectableName,1)
			parent.queue_free()
