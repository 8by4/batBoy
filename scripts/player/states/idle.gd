extends BaseStatePlayer

func enter():
	pass

func physics_update(delta):
	super.physics_update(delta)
	animate()
	
	entity.velocity = lerp(entity.velocity, Vector2.ZERO, entity.friction * delta)
	entity.velocity = Vector2.ZERO
	
	if entity.move_dir != Vector2.ZERO:
		return entity.move
	
	if entity.input_attack:
		return entity.attack

func animate():
	if entity.cursor_dir < -45 and entity.cursor_dir > -135:
		entity.animator.play("IdleUp")
	if entity.cursor_dir > 45 and entity.cursor_dir < 135:
		entity.animator.play("IdleDown")
	if entity.cursor_dir < 45 and entity.cursor_dir > -45:
		entity.animator.play("IdleRight")
	if entity.cursor_dir < - 135 or entity.cursor_dir > 135:
		entity.animator.play("IdleLeft")
