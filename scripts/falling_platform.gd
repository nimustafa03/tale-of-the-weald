extends StaticBody3D

@onready var collision : CollisionShape3D = $CollisionShape3D
@onready var mesh : MeshInstance3D = $MeshInstance3D
@onready var detector : CollisionShape3D = $Area3D/CollisionShape3D

@export var FALLING_WAIT = 2.0
@export var PLATFORM_RESTART_WAIT = 2.0

func fall() -> void:
	await get_tree().create_timer(FALLING_WAIT).timeout
	detector.set_deferred("disabled", true)
	collision.set_deferred("disabled", true)
	mesh.set_deferred("visible", false) ## Se podrían reproducir animaciones más complejas.
	restart()

func restart() -> void:
	await get_tree().create_timer(PLATFORM_RESTART_WAIT).timeout
	detector.set_deferred("disabled", false)
	collision.set_deferred("disabled", false)
	mesh.set_deferred("visible", true)

func _on_area_3d_area_entered(area):
	if area is PlayerHitboxComponent:
		fall()
