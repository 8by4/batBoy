extends BaseStateEnemy

func enter():
	animate()
	entity.hitbox_comp.set_collision_mask_value(2, false)

func animate():
	if entity.health == 0:
		entity.animator.play("Dying")
	elif entity.health < 0:
		entity.animator.play(entity.states.current_state.animation_name)

func physics_update(delta):
	super.physics_update(delta)
	
	if entity.velocity != Vector2.ZERO:
		entity.velocity = lerp(entity.velocity, Vector2.ZERO, entity.friction * delta)
	
	var collision_info = entity.move_and_collide(entity.velocity * delta)
	if collision_info:
		if collision_info.get_collider() is Enemy:
			collision_info.get_collider().velocity = entity.velocity
		
		entity.velocity = entity.velocity.bounce(collision_info.get_normal())
	
	var magnitude = entity.velocity.length()
