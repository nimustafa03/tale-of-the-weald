extends Attack

func _on_hitbox_component_area_entered(area):
	if area is PlayerHitboxComponent:
		###attack.attack_damage = attack_damage ### Esto no hace nada en realidad, porque le asigna al ataque el daño base de la clase. Sirve tenerlo acá para poder recordarlo en posteriores códigos.
		area.damage(self)
