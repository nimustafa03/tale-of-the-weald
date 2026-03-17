extends Control

@onready var spores : Label = $IntefaceLayer/PanelContainer/MarginContainer/GridContainer/SporeCollectable
@onready var primitives: Label = $IntefaceLayer/PanelContainer/MarginContainer/GridContainer/PrimitiveCollectable
@onready var health: Label = $IntefaceLayer/VBoxContainer/Health
@onready var healthBar: ProgressBar = $IntefaceLayer/VBoxContainer/HealthBar
@onready var sporeAttackBar: ProgressBar = $IntefaceLayer/SporeAttackCoolDownBar
@onready var player : Player = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spores.text = str(player.collectableComponent.collectables[1])
	primitives.text = str(player.collectableComponent.collectables[0])
	health.text = str(player.healthComponent.health)
	healthBar.value = player.healthComponent.health
	sporeAttackBar.max_value = player.sporeAttackCooldown.get_wait_time()
	sporeAttackBar.value= player.sporeAttackCooldown.get_time_left()
