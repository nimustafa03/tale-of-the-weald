extends Label
@export var parent : Player
@onready var collectableComponent : CollectableComponent

func _process(_delta):
	text = "Primitives: " + "%s" %parent.collectableComponent.collectables[0] + "\n" + "Spores: " + "%s" %parent.collectableComponent.collectables[1]
