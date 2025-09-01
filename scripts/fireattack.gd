extends Attack


func _on_hitbox_component_area_entered(area):
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		var attack = Attack.new()
		###attack.attack_damage = attack_damage ### Esto no hace nada en realidad, porque le asigna al ataque el daño base de la clase. Sirve tenerlo acá para poder recordarlo en posteriores códigos.
		hitbox.damage(attack)
