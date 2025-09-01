extends Label
@export var parent : Player
@onready var collectableComponent : CollectableComponent

func _process(delta):
	text = "Primitives: " + "%s" %parent.collectableComponent.collectables[0] + "\n" + "Spores: " + "%s" %parent.collectableComponent.collectables[1]
