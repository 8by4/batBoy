extends BaseState
class_name BaseStateEnemy

@export var animation_name : String

var entity : Enemy

func enter():
	super.enter()
	entity.animator.play(animation_name)

func physics_update(delta):
	super.physics_update(delta)

func exit():
	super.exit()
