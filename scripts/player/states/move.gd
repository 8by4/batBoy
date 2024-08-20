extends BaseStatePlayer

func physics_update(delta):
	super.physics_update(delta)
	animate()
	entity.velocity = entity.move_dir * entity.speed * delta
	
	if entity.move_dir == Vector2.ZERO:
		return entity.idle
	
	if entity.input_dodge:
		return entity.dodge
	
	if entity.input_attack:
		return entity.attack

func animate():
	if entity.cursor_dir < -45 and entity.cursor_dir > -135:
		entity.animator.play("up")
	if entity.cursor_dir > 45 and entity.cursor_dir < 135:
		entity.animator.play("down")
	if entity.cursor_dir < 45 and entity.cursor_dir > -45:
		entity.animator.play("right")
	if entity.cursor_dir < - 135 or entity.cursor_dir > 135:
		entity.animator.play("left")
