extends Label

@export var parent : Player
@onready var healthComponent : HealthComponent 

func _process(delta):
	text = "%s/" %parent.healthComponent.max_health + "%s" %parent.healthComponent.health
