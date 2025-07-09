extends Label

@export var parent : Player
@onready var healthComponent : HealthComponent 

func _process(delta):
	text = "%s" %parent.healthComponent.health + "%s/" %parent.healthComponent.max_health 
