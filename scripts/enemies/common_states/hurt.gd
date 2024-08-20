extends BaseStateEnemy

func enter():
	super.enter()
	print("hurt")
	
	entity.can_get_hurt = false
	
	entity.knockback()
	entity.health -= entity.incoming_attack.attack_damage
	entity.hitbox_comp.set_collision_mask(4)
	
	await get_tree().create_timer(0.25).timeout
	entity.can_get_hurt = true

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
	
	if abs(magnitude) <= 12:
		if entity.health <= 0:
			return entity.dead
		else:
			return entity.idle

#func exit():
	#entity.hitbox_comp.set_collision_mask(2)
