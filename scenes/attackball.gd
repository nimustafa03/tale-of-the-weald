extends Attack


func _on_area_3d_area_entered(area):
	if area is PlayerHitboxComponent :
		area.damage(self)
