extends Node
class_name StateManager

@export var starting_state : NodePath

var current_state : BaseState

func change_state(new_state : BaseState):
	if current_state:
		current_state.exit()
	
	if current_state:
		current_state = null
	
	current_state = new_state
	current_state.enter()

func init(entity : CharacterBody2D):
	for child in get_children():
		child.entity = entity
	
	change_state(get_node(starting_state))

func physics_update(delta):
	var new_state = current_state.physics_update(delta)
	if new_state:
		change_state(new_state)
#
func input(event : InputEvent):
	if current_state is BaseStatePlayer:
		var new_state = current_state.input(event)
		if new_state:
			change_state(new_state)
