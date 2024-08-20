extends BaseState
class_name BaseStatePlayer

@export var animation_name : String

var entity : Player

func enter():
	super.enter()
	entity.animator.play(animation_name)
	print(entity.name, ": ", animation_name)

func input(event : InputEvent):
	return null

func physics_update(delta):
	super.physics_update(delta)
	
	entity.aim()
	entity.movement_input()
	entity.move_and_slide()

func exit():
	super.exit()
