extends Enemy

# Unique states
@onready var idle = $StateManager/Idle
@onready var pursue = $StateManager/Pursue
@onready var wait = $StateManager/Wait

func _on_hitbox_component_area_entered(area):
	if area.get_collision_layer() == 2: # player
		states.change_state(wait)
